
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// This class is for generating a dialog to alert the users that they have entered the wrong password or username.

class PopUpPageForLoginFail extends StatefulWidget {
  const PopUpPageForLoginFail(
      {Key key,
        this.buttonColor = Colors.blueAccent,
        this.buttonString = "OK",
      })
      : super(key: key);

  ///the color of the button of this dialog
  final Color buttonColor;
  ///the text on the button of this dialog
  final String buttonString;


  @override
  PopUpPageForLoginFailState createState() {
    return PopUpPageForLoginFailState();
  }
}

class PopUpPageForLoginFailState extends State<PopUpPageForLoginFail> with TickerProviderStateMixin {

  ///width of this dialog
  double width;
  ///height of this dialog
  double height;

  
  ///the color of the button in this state of this dialog.
  Color buttonColor;
  ///the text on the button in this state of this dialog.
  String buttonString;

  @override
  void initState() {
    
    buttonColor = widget.buttonColor;
    buttonString = widget.buttonString;

    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //obtain the width of the screen
    width = MediaQuery.of(context).size.width;
    //obtain the height of the screen
    height = MediaQuery.of(context).size.height;

    //the width of this dialog
    var dialogWidth = 0.8 * height;
    //the height of this dialog
    var dialogHeight = 0.8 * width;
    
    //creates a rounded-rectangular clip to contain the image
    var image = ClipRRect(
      child: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.fill,
        width: dialogWidth * 0.25,
        height: dialogHeight * 0.25,
      ),
      borderRadius: BorderRadius.all(
         Radius.circular(15),)
    );


    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 15 ),
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          width: dialogWidth,
          height: dialogHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              image,
              SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
              Padding(
                padding: const EdgeInsets.only(left:5,top:12),                                          child: Text(
                'UserName or password is wrong!',
                style: TextStyle(
                    fontFamily: "Poppins-Bold",
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
              SizedBox(height: ScreenUtil.getInstance().setHeight(20)),

              SizedBox(height: ScreenUtil.getInstance().setHeight(50)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[

                    customButton(buttonString, buttonColor),

                  ],
                ),
              )
            ],
          ),
        ),
      );
  }

  Widget customButton(String t, Color c) {
    return
      Container(
        // ignore: deprecated_member_use
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)
          ),
          child: Text(
            t,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),

          onPressed: (){

            Navigator.of(context).pop();
          },
        ),
      );
  }






}




