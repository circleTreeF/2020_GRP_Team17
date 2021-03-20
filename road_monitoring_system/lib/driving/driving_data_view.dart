import 'dart:async';
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:road_monitoring_system/driving/widgets/card.dart';
import 'package:road_monitoring_system/driving/widgets/card1.dart';
import 'package:sensors/sensors.dart';
import '../score_screen.dart';
import '../utils/app_theme.dart';
import 'package:intl/intl.dart';

import 'controller/driving_data_process.dart';

class DrivingDataView extends StatefulWidget {



  @override
  DrivingDataViewState createState() {
    // TODO: implement createState
    return DrivingDataViewState();
  }
}

class DrivingDataViewState extends State<DrivingDataView>
    with SingleTickerProviderStateMixin {
  Position position;
  StreamSubscription<Position> positionStreamSubscription;
  AccelerometerEvent event;
  StreamSubscription<AccelerometerEvent> streamSubscriptions;


  bool drivingCondition = false;
  final positions = <Position>[];
  final accelerometerEvent = <AccelerometerEvent>[];
  Map<String,DateTime > time;
  DateTime startTime;
  DateTime endTime;
  DrivingDataProcess dataProcess = new DrivingDataProcess();

  List<Map<String,double>> storeList = <Map<String,double>>[]; //list after first filter
  List<Map<String,double>> finalList = <Map<String,double>>[]; //list after second filter



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
                        EmptyCard(height: 50.0, width: 100.0,text: cardTextAccX()),
                        EmptyCard(height: 50.0, width: 100.0,text: cardTextAccY()),
                        EmptyCard(height: 50.0, width: 100.0,text: cardTextAccZ()),
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
                        EmptyCard(height: 50.0, width: 100.0,text: cardTextLong()),
                        EmptyCard(height: 50.0, width: 100.0,text: cardTextLat()),
                      ],
                    ),
                  ),


                  SizedBox(height: ScreenUtil.getInstance().setHeight(70)),

                  Container(
                    height: 100,
                    child: RaisedButton(
                      child: buttonText(),
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.cyanAccent),
                      ),
                      onPressed: () {
                        setState(() {
                          toggleListening();
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




  String cardTextAccX() {
    if (event != null&&isListeningPosition()) {
      return '${event.x.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  String cardTextAccY() {
    if (event != null&&isListeningPosition()) {
      return '${event.y.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  String cardTextAccZ() {
    if (event != null&&isListeningPosition()) {
      return '${event.z.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  String cardTextLong() {
    if (event != null&&isListeningPosition()) {
      return '${position.longitude.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  String cardTextLat() {
    if (event != null&&isListeningPosition()) {
      return '${position.latitude.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  void toggleListeningGPS() {
    positionStreamSubscription =
        positionStream.listen((position) => setState(() {
          positions.add(position);
          this.position = position;
        }));
  }

  void toggleListeningAcc() {


    streamSubscriptions =
        accelerometerEvents.listen((AccelerometerEvent event) {
          if(mounted) {
            setState(() {
              this.event = event;
              accelerometerEvent.add(event);

            });
          }
        });
  }


  /// gets current time
  double currentMillSecond() {
    return new DateTime.now().millisecondsSinceEpoch.toDouble();
  }



  ///listen gps and acc
  toggleListening()   {

    if (drivingCondition == false) {
      String string = dateFormat.format(DateTime.now());

      startTime=dateFormat.parse(string);
      toggleListeningGPS();
      toggleListeningAcc();
      if(position!=null&&event!=null){
      addToList();}
      drivingCondition = true;
    } else {
      String string = dateFormat.format(DateTime.now());
      endTime=dateFormat.parse(string);
      pauseStream();

      drivingCondition = false;

    }

  }



  bool isListeningPosition() => !(positionStreamSubscription == null ||
      positionStreamSubscription.isPaused);



  void pauseStream() {
    positionStreamSubscription.pause();
    streamSubscriptions.pause();

    //TODO: CLICK BUTTON ,data clean.

    //processing data in DrivingDataProcess class
    finalList = dataProcess.firstFilter(storeList);


    time= {
      "start_time" : startTime,
      "end_time": endTime
    };
    print(finalList);
    popUpScore(finalList,time);
    // _popUpScore(_storeList,time);
  }

  Text buttonText() {

    return isListeningPosition()
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

  void addToList(){
    double timeStamp;
    double lastTime = 0;
    if (storeList.isNotEmpty) lastTime = storeList.last['time'];
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
      storeList.add(
          _mapList); //each time new piece of data generated, added to _storeList
    }
  }

  Future<dynamic> popUpScore(List<Map<String,double>> _storeList,Map<String,DateTime> time) {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            Score(list: _storeList,time: time));
  }

  @override
  void dispose() {

    if (positionStreamSubscription != null) {
      positionStreamSubscription.cancel();
      positionStreamSubscription = null;
    }

    super.dispose();
  }


}

