

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_monitoring_system/utils/constant.dart';

import '../../database/model/Data.dart';
import '../../database/controller/post.dart';
import '../controller/driving_data_process.dart';
import '../../login/model/user_account.dart';


///[Score] shows a dialog containing [mark] and [rank].
class Score extends StatefulWidget {
  const Score(
      {Key key,
        this.buttonColor = Colors.blueAccent,
        this.buttonString = "OK",
        this.list,
        this.time,
    
      })
      : super(key: key);

  
  ///The color of the button of this dialog
  final Color buttonColor;
  ///The text on the button of this dialog
  final String buttonString;
  ///The list of data need to be posted to database
  final  List<Map<String,double>> list;
  ///the map contains the start time and the end time
  final Map<String,DateTime> time;

  @override
  ScoreState createState() {
    return ScoreState();
  }
}

class ScoreState extends State<Score> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  
  
  ///width of this dialog
  double width;
  ///height of this dialog
  double height;


  ///The color of the button in this state of this dialog.
  Color buttonColor;
  ///The text on the button in this state of this dialog.
  String buttonString;
  ///The final mark for this round of driving
  String mark;
  ///The final rank
  int rank;
  ///the map contains the start time and the end time
  Map<String,DateTime> time;

  @override
  void initState() {
    ///instance of DrivingDataProcess class
    DrivingDataProcess dataProcess = new DrivingDataProcess();
    ///Gets marks
    mark= dataProcess.drivingGrade(widget.list);
    ///Generates the [Data] and Sends data to database
    sendData(mapGenerator());


    buttonColor = widget.buttonColor;
    buttonString = widget.buttonString;
    
    time= widget.time;

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animation = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animation.addListener(() {
      setState(() {});
    });

    animationController.forward();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ///the width of the screen
    width = MediaQuery.of(context).size.width;
    ///the height of the screen
    height = MediaQuery.of(context).size.height;

    ///the width of this dialog
    var dialogWidth = 0.8 * height;
    ///the height of this dialog
    var dialogHeight = 0.8 * width;



    ///Creates a rounded-rectangular clip to contain the image
    // var image = ClipRRect(
    //     child: Image(
    //       image: AssetImage(imageChoose()),
    //       fit: BoxFit.fill,
    //       width: dialogWidth * 0.25,
    //       height: dialogHeight * 0.45,
    //     ),
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(15),)
    // );

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
                      transform: Matrix4.translationValues(
                                 0,
                                 0,
                                  0
                      ),
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            ),
                      child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                      Padding(
                      padding: const EdgeInsets.only(left:5,top:12),                                          child: Text(
                textChoose(),
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


                                                      cancelButton(),

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

  ///Generates the [Data]
  Data mapGenerator() {
    return new Data(UserAccount().user_id,widget.time["start_time"],widget.time["end_time"],widget.list,mark);
  }


  /** 
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/9 3:38 PM
  *** @version:2.1
  **/
  ///Sends the [Data] to database and gets the [rank] from the database.
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


