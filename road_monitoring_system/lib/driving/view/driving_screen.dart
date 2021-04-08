import 'dart:async';
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:road_monitoring_system/driving/util/constant_style.dart';
import 'package:road_monitoring_system/driving/widgets/data_card.dart';
import 'package:road_monitoring_system/driving/widgets/title_card.dart';
import 'package:sensors/sensors.dart';
import 'score_screen.dart';
import 'package:intl/intl.dart';

import '../controller/driving_data_process.dart';


///This class describes the interface that displays the driving data for users.
class DrivingScreen extends StatefulWidget {

  @override
  DrivingScreenState createState() {
    // TODO: implement createState
    return DrivingScreenState();
  }

}

///This class describes the state of the widgets on the driving interface.
class DrivingScreenState extends State<DrivingScreen>
    with SingleTickerProviderStateMixin {
  ///If the users are driving, the [drivingCondition] is true, else is false.
  bool drivingCondition = false;
  ///The list contains the [Position] objects.
  final positions = <Position>[];
  ///The list contains the [AccelerometerEvent] objects.
  final accelerometerEvent = <AccelerometerEvent>[];
  ///Location information collection.
  Position position;
  ///The event starts all location sensors on the device and will keep them
  /// active until you cancel listening to the stream or when the application
  /// is killed.
  final positionStream = Geolocator.getPositionStream();
  ///The subscription on events from a [positionStream] and holds the callbacks.
  StreamSubscription<Position> positionStreamSubscription;
  ///The Acceleration event collected by sensor and it is use to obtain the acceleration data in x, y, z axis.
  AccelerometerEvent event;
  ///The subscription on events from a accelerometerEvents and holds the callbacks.
  StreamSubscription<AccelerometerEvent> streamSubscriptions;

  ///The start time of this round of driving.
  DateTime startTime;
  ///The end time of this round of driving.
  DateTime endTime;
  ///The map stores the [startTime] and [endTime].
  Map<String,DateTime > time;

  ///The instance of the [DrivingDataProcess] class.
  DrivingDataProcess dataProcess = new DrivingDataProcess();
  ///The list stores the data collected.
  List<Map<String,double>> storeList = <Map<String,double>>[];
  ///The list stores the data filtered.
  List<Map<String,double>> finalList = <Map<String,double>>[]; //list after second filter
  /// The new DateFormat.
  DateFormat dateFormat;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time=new Map<String,DateTime >();
    dateFormat=DateFormat("yyyy-MM-dd HH:mm:ss");//initial the new date format
  }



  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    //Initialize and set the fit size and font size to scale
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
                  SizedBox(height: ScreenUtil.getInstance().setHeight(150)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TitleCard(height: 35.0, width: 200.0,text: "Acceleration force"),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
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
                        DataCard(height: 50.0, width: 100.0,text: cardTextAccX()),
                        DataCard(height: 50.0, width: 100.0,text: cardTextAccY()),
                        DataCard(height: 50.0, width: 100.0,text: cardTextAccZ()),
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
                        DataCard(height: 50.0, width: 100.0,text: cardTextLong()),
                        DataCard(height: 50.0, width: 100.0,text: cardTextLat()),
                      ],
                    ),
                  ),


                  SizedBox(height: ScreenUtil.getInstance().setHeight(70)),

                  Container(
                    height: 100,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      child: buttonText(),

                      shape: CircleBorder(
                        side: BorderSide(color: defaultBorderColor),
                      ),
                      onPressed: () {
                        setState(() {
                          toggleListening();// start listening or stop listening
                        });

                      },
                    )// The button use for start and stop

                  ),

                ],

              ),

            ),


          ),
        ),
      ),
    );
  }

  /**
   *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
   *** @date: 2021/2/15 3:12 PM
   *** @version:1.2
   **/

  ///Returns the content of [Text] contains the Acceleration force along the x axis (including gravity) measured in m/s^2
  String cardTextAccX() {
    if (event != null&&isListeningPosition()) {
      return '${event.x.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  /**
   *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
   *** @date: 2021/2/15 3:12 PM
   *** @version:1.2
   **/
  
  ///Returns the content of [Text] contains the Acceleration force along the y axis (including gravity) measured in m/s^2
  String cardTextAccY() {
    if (event != null&&isListeningPosition()) {
      return '${event.y.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

  /**
   *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
   *** @date: 2021/2/15 3:12 PM
   *** @version:1.2
   **/
 
  ///Returns the content of [Text] contains the Acceleration force along the z axis (including gravity) measured in m/s^2
  String cardTextAccZ() {
    if (event != null&&isListeningPosition()) {
      return '${event.z.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/2/15 3:12 PM
*** @version:1.2
**/

  ///Returns the content of [Text] contains the longitude of this position in degrees normalized to the interval -90.0
  String cardTextLong() {
    if (position != null&&isListeningPosition()) {
      return '${position.longitude.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/21 7:14 PM
*** @version:1.2
**/
  ///Returns the content of [Text] contains the latitude of this position in degrees normalized to the interval -90.0
  String cardTextLat() {
    if (position != null&&isListeningPosition()) {
      return '${position.latitude.roundToDouble()}';
    } else {
      return 'wait';
    }
  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/1/11 7:30 PM
*** @version:2.1
**/

  ///Listens the location information
  void toggleListeningGPS() {
    positionStreamSubscription =
        positionStream.listen((position) => setState(() {
          positions.add(position);
          this.position = position;
        }));
  }


  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/1/11 7:30 PM
  *** @version:2.1
  **/

  ///Listens Acceleration force
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



  /// Gets current time
  double currentMillSecond() {
    return new DateTime.now().millisecondsSinceEpoch.toDouble();
  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/1 7:27 PM
*** @version:3.1
**/

  

  ///Called when clicking the button on this screen.
  ///
  ///If [drivingCondition] is false, go to listen and store GPS and Acceleration force data.
  ///if [drivingCondition] is true, pause the listening stream.
  toggleListening()   {

    if (drivingCondition == false) {

      String string = dateFormat.format(DateTime.now());//converts the dataTime to certain format
      startTime=dateFormat.parse(string);// parses the inputString into the dateFormat
      toggleListeningGPS();
      toggleListeningAcc();
      if(position!=null&&event!=null){ addToList(); }//add the data to list in order to send to database.
      drivingCondition = true;

    } else {
      String string = dateFormat.format(DateTime.now());
      endTime=dateFormat.parse(string);
      pauseStream();
      drivingCondition = false;

    }

  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/1/17 5:35 PM
*** @version:1.2
**/

  ///Returns the condition of collecting GPS data.
  ///
  ///Returns [True] if the app has started to listen to position
  ///Returns [False] if the app has not started to listen to position
  bool isListeningPosition() => !(positionStreamSubscription == null ||
      positionStreamSubscription.isPaused);

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/7 11:27 AM
*** @version:1.3
**/
  

  /// Pauses the [positionStreamSubscription] and [streamSubscriptions].
  ///
  /// Filters the data and pop up the score screen.
  void pauseStream() {
    positionStreamSubscription.pause();
    streamSubscriptions.pause();

    finalList = dataProcess.firstFilter(storeList);//filter the data

    time= {
      "start_time" : startTime,
      "end_time": endTime
    };// the map of time
    popUpScorePage(finalList,time);//pop up the score page.
  }

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/21 7:27 PM
  *** @version:2.2
  **/
  
  /// Returns [Text] on the button
  ///
  /// If users press this [button] to start driving, the [Text] will be 'stop';
  /// If users are not driving, the [Text] will be 'start;
  Text buttonText() {

    return isListeningPosition()
        ? Text('stop',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          fontSize: 24,
          letterSpacing: 0.0,
          color: defaultButtonColor,
        ))
        : Text('start',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          fontSize: 24,
          letterSpacing: 0.0,
          color: defaultButtonColor,
        ));


  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/10 4:11 PM
*** @version:2.3
**/

  ///Adds data required of [event] and [position] to the list
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

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/2/21 7:27 PM
*** @version:2.1
**/

  ///Pops up the score page
  ///
  ///Sends [finalList] the list of data which should be sent to database and [time] to score page.
  ///
  Future<dynamic> popUpScorePage(List<Map<String,double>> finalList,Map<String,DateTime> time) {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            Score(list: finalList,time: time));
  }

/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/1/11 3:27 PM
*** @version:1.2
**/

  @override
  ///Called when leaving from this page and cancels the subscriptions.
  void dispose() {

    if (positionStreamSubscription != null) {
      positionStreamSubscription.cancel();
      positionStreamSubscription = null;
    }

    super.dispose();
  }


}

