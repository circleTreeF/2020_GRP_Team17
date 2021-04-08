

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_monitoring_system/utils/constant.dart';

import '../../database/model/Data.dart';
import '../../database/controller/post.dart';
import '../controller/driving_data_process.dart';
import '../../login/model/user_account.dart';


///This class represents the score interface containing [mark] and [rank].
class Score extends StatefulWidget {
  ///The Constructor initializes the button color and the text on button.
  const Score(
      {Key key,
        this.buttonColor = Colors.blueAccent,
        this.buttonString = "OK",
        this.list,
        this.time,
      })
      : super(key: key);

  
  ///The color of the button of this interface
  final Color buttonColor;
  ///The text on the button of this interface
  final String buttonString;
  ///The list of data which should be sended to database
  final  List<Map<String,double>> list;
  ///The map contains the start time and the end time
  final Map<String,DateTime> time;

  @override
  ScoreState createState() {
    return ScoreState();
  }
}

///This class describes the state of the widgets on this interface.
class ScoreState extends State<Score> with TickerProviderStateMixin {
  ///The controller of the animation on this interface
  AnimationController animationController;
  ///The animation on this interface.
  Animation animation;
  
  
  ///The width of this interface
  double width;
  ///The height of this interface
  double height;


  ///The color of the button in this state of this interface.
  Color buttonColor;
  ///The text on the button in this state of this interface.
  String buttonString;
  ///The final mark for this round of driving
  String mark;
  ///The final ranking for this user among all the users.
  int rank;
  ///The map contains the start time and the end time
  Map<String,DateTime> time;

  @override
  void initState() {
    //The instance of [DrivingDataProcess] class
    DrivingDataProcess dataProcess = new DrivingDataProcess();
    //Generates the mark
    mark= dataProcess.drivingGrade(widget.list);
    //Generates the [Data] object and Sends it to database
    sendData(mapGenerator());

    //Sets the color of the button
    buttonColor = widget.buttonColor;
    //Sets the text on the button
    buttonString = widget.buttonString;
    //Sets the time
    time= widget.time;
    //Sets the controller of the animation
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    //Sets the animation
    animation = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    //add the listener on this animation
    animation.addListener(() {
      setState(() {});
    });

    animationController.forward();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ///The width of the screen of the devices
    width = MediaQuery.of(context).size.width;
    ///The height of the screen of the devices
    height = MediaQuery.of(context).size.height;

    ///The width of this interface
    var dialogWidth = 0.8 * height;
    ///The height of this interface
    var dialogHeight = 0.8 * width;


    return GestureDetector(
      onTap: (){Navigator.of(context).pop();},
      child: Dialog(
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: Container(
                      width: dialogWidth,
                      height: dialogHeight,
                      transform: Matrix4.translationValues(0, 0, 0),
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            ),
                      child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                      Padding(
                      padding: const EdgeInsets.only(left:5,top:12),
                        child: Text(
                      textChoose(), //choose the score
                      style: scoreTextStyle,
                      ),
                      ),
                                SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
                                Padding(
                                  padding: const EdgeInsets.only(left:5,top:10),                                          child: Text(
                                                 'End Time:   ${time["end_time"]}',
                                                  style: TextStyle(
                                                      fontFamily: "Poppins-Bold",
                                                          color: Colors.indigoAccent,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                          ),
                                SizedBox(height: ScreenUtil.getInstance().setHeight(20)),
                                Padding(
                                  padding: const EdgeInsets.only(left:5,top:10),
                                  child: Text(
                                    'Ranking:     $rank',
                                    style: TextStyle(
                                        fontFamily: "Poppins-Bold",
                                        color: Colors.indigoAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                SizedBox(height: ScreenUtil.getInstance().setHeight(50)),
                                          Container(
                                            child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,

                                                    children: <Widget>[

                                                      cancelButton(),// the button for close this interface

                                                            ],
                                                    ),
                                            )
                                  ],
                              ),
                    ),
              ),
        );
  }

  /** 
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/9 3:38 PM
  *** @version:1.0
  **/

  ///Creates the button in this dialog.
  Widget cancelButton() {
    return 
      Container(
        // ignore: deprecated_member_use
        child: RaisedButton(
                shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                child: Text(
                        'OK',
                        style: TextStyle(color: Colors.indigo, fontSize: 18, fontFamily: "Poppins-Bold"),

                      ),
                onPressed: (){
                      Navigator.of(context).pop();
                      },
                ),
        );
  }


  /** 
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/9 3:38 PM
  *** @version:1.0
  **/

  ///Generates the [Data] object.
  Data mapGenerator() {
    return new Data(UserAccount().user_id,widget.time["start_time"],widget.time["end_time"],widget.list,mark);
  }


  /** 
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/9 3:38 PM
  *** @version:2.1
  **/
  ///Sends the [Data] object to database and gets the [rank] from the database.
   void sendData(Data data) {

    Map<String, dynamic> dataJson= data.toJson(data);

    final putData = jsonEncode(dataJson);
     print(putData);

    createPostToAddRecord(putData).then((response) {
      if (response.statusCode >= 200) {
        var _content = response.body;
        Map<String, dynamic> enter = json.decode(_content);
        setState(() {
          rank=enter["rank"];
        });
        print(enter["result"]);
       print(enter["rank"]);

      }
      else
        print(response.statusCode);
    }
    ).catchError((error){
      print('error : $error');
    });
  }

  /** 
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/9 3:38 PM
  *** @version:2.0
  **/
  ///Return the string to represent the [mark]
  // ignore: missing_return
  String textChoose() {

    if(mark=="A") {

      return  'A';
    }
    if(mark=="B") {

      return  'B';
    }
    if(mark=="C") {

      return  'C';
    }
   if(mark=="D") {

      return  'D';
    }

  }

}


