import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/driving/controller/driving_data_process.dart';
import 'package:flutter_app/driving/widgets/card.dart';
import 'package:flutter_app/driving/widgets/card1.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors/sensors.dart';
import 'package:timezone/timezone.dart' as tz;
import '../score_screen.dart';
import '../utils/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
class DrivingDataView extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrivingDataViewState();
  }
}

class _DrivingDataViewState extends State<DrivingDataView>
    with SingleTickerProviderStateMixin {
  Position position;///
  StreamSubscription<Position> _positionStreamSubscription;
  AccelerometerEvent event;
  StreamSubscription<AccelerometerEvent> _streamSubscriptions;


  bool drivingCondition = false;
  final _positions = <Position>[];
  final _accelerometerEvent = <AccelerometerEvent>[];
  Map<String,DateTime > time;
  DateTime startTime;
  DateTime endTime;
  DrivingDataProcess dataProcess = new DrivingDataProcess();

  List<Map<String,double>> _storeList = <Map<String,double>>[]; //list after first filter
  List<Map<String,double>> _finalList = <Map<String,double>>[]; //list after second filter

  StreamSubscription<AccelerometerEvent> get streamSubscriptions =>
      _streamSubscriptions;

  final positionStream = Geolocator.getPositionStream();
  DateFormat dateFormat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = new Map<String,DateTime >();
    dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(


          padding: const EdgeInsets.all(16.0),
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: MediaQuery.of(context).size.width / 2,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  SizedBox(height: ScreenUtil.getInstance().setHeight(200)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TitleCard(height: 35.0, width: 80.0,text: "x"),
                        TitleCard(height: 35.0, width: 80.0,text: "y"),
                        TitleCard(height: 35.0, width: 80.0,text: "z"),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EmptyCard(height: 50.0, width: 100.0,text: _cardTextAccX()),
                        EmptyCard(height: 50.0, width: 100.0,text: _cardTextAccY()),
                        EmptyCard(height: 50.0, width: 100.0,text: _cardTextAccZ()),
                      ],
                    ),
                  ),

                  SizedBox(height: ScreenUtil.getInstance().setHeight(70)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TitleCard(height: 35.0, width: 120.0,text: "longitude"),
                        TitleCard(height: 35.0, width: 120.0,text: "latitude"),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EmptyCard(height: 50.0, width: 100.0,text: _cardTextLong()),
                        EmptyCard(height: 50.0, width: 100.0,text: _cardTextLat()),
                      ],
                    ),
                  ),


                  SizedBox(height: ScreenUtil.getInstance().setHeight(70)),

                  Container(
                    height: 100,
                    child: RaisedButton(
                      child: _buttonText(),
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.cyanAccent),
                      ),
                      onPressed: () {
                        setState(() {
                          _toggleListening();
                        });

                      },
                    ),
                  ),



                ],


              ),

            ),


          ),
        ),
      ),
    );
  }




  String _cardTextAccX() {
    if (event != null&&_isListeningPosition()) {
      return '${event.x.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  String _cardTextAccY() {
    if (event != null&&_isListeningPosition()) {
      return '${event.y.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  String _cardTextAccZ() {
    if (event != null&&_isListeningPosition()) {
      return '${event.z.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  String _cardTextLong() {
    if (event != null&&_isListeningPosition()) {
      return '${position.longitude.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  String _cardTextLat() {
    if (event != null&&_isListeningPosition()) {
      return '${position.latitude.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  void _toggleListeningGPS() {
    _positionStreamSubscription =
        positionStream.listen((position) => setState(() {
              _positions.add(position);
              this.position = position;
            }));
  }

  void _toggleListeningAcc() {
    double timeStamp;
    double lastTime = 0;

    _streamSubscriptions =
        accelerometerEvents.listen((AccelerometerEvent event) {
          if(mounted) {
            setState(() {
              this.event = event;
              _accelerometerEvent.add(event);

              if (_storeList.isNotEmpty) lastTime = _storeList.last['time'];
              timeStamp = currentMillSecond();
              Map<String, double> _mapList = new Map<String, double>();
              _mapList = {
                'time': timeStamp,
                'latitude': position.latitude,
                'longitude': position.longitude,

                'x': event.x,
                'y': event.y,
                'z': event.z};
              if (lastTime + 100 <= timeStamp) {
                //keep the 100 millisecond time slot
                _storeList.add(
                    _mapList); //each time new piece of data generated, added to _storeList
              }
            });
          }
    });
  }


  /// gets current time
  double currentMillSecond() {
    return new DateTime.now().millisecondsSinceEpoch.toDouble();
  }



///listen gps and acc
    _toggleListening()   {
     // tz.initializeTimeZones();
     // var detroit = tz.getLocation('Asia/Shanghai');
     // tz.setLocalLocation(detroit);
    if (drivingCondition == false) {
      //String string = dateFormat.format(tz.TZDateTime.now(detroit));
      String string = dateFormat.format(DateTime.now());

      startTime=dateFormat.parse(string);
      _toggleListeningGPS();
      _toggleListeningAcc();
      drivingCondition = true;
    } else {
    //  String string = dateFormat.format(tz.TZDateTime.now(detroit));
      String string = dateFormat.format(DateTime.now());
      endTime=dateFormat.parse(string);
      _pauseStream();

      drivingCondition = false;

    }

  }



  bool _isListeningPosition() => !(_positionStreamSubscription == null ||
      _positionStreamSubscription.isPaused);



  void _pauseStream() { 
    _positionStreamSubscription.pause();
    _streamSubscriptions.pause();

 //TODO: CLICK BUTTON ,data clean.

    //processing data in DrivingDataProcess class
    _finalList = dataProcess.firstFilter(_storeList);


  time= {
    "start_time" : startTime,
    "end_time": endTime
  };
  print(_finalList);
    _popUpScore(_finalList,time);
   // _popUpScore(_storeList,time);
  }

  Text _buttonText() {

    return _isListeningPosition()
        ? Text('stop',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppTheme.fontName,
          fontWeight: FontWeight.normal,
          fontSize: 24,
          letterSpacing: 0.0,
          color: AppTheme.nearlyDarkBlue,
        ))
        : Text('start',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppTheme.fontName,
          fontWeight: FontWeight.normal,
          fontSize: 24,
          letterSpacing: 0.0,
          color: AppTheme.nearlyDarkBlue,
        ));


  }

  Future<dynamic> _popUpScore(List<Map<String,double>> _storeList,Map<String,DateTime> time) {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            Score(list: _storeList,time: time));
  }

  @override
  void dispose() {

    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }

    super.dispose();
  }


}


