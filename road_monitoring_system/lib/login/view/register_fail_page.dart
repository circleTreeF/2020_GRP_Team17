


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_monitoring_system/utils/constant.dart';


/// This class is for generating a dialog to alert the users that they have entered the existing [username].

class PopUpPageForRegisterFail extends StatefulWidget {
  const PopUpPageForRegisterFail(
      {Key key,


      })
      : super(key: key);




  @override
  PopUpPageForRegisterFailState createState() {
    return PopUpPageForRegisterFailState();
  }
}

/// The state of the register fail page
class PopUpPageForRegisterFailState extends State<PopUpPageForRegisterFail> with TickerProviderStateMixin {

  ///width of this dialog
  double width;
  ///height of this dialog
  double height;



  @override
  void initState() {



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
    var image = ClipRRect(
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.fill,
          width: dialogWidth * 0.25,
          height: dialogHeight * 0.45,
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
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            image,
            SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
            Padding(
              padding: const EdgeInsets.only(left:5,top:12),                                          child: Text(
              'Existing UserName!',
              style: existingUserNameTextStyle,
            ),
            ),
            SizedBox(height: ScreenUtil.getInstance().setHeight(20)),

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
    );
  }


  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/2 3:35 PM
  *** @version:1.0
  **/
/// Return the button which can be used to close the dialog
  Widget cancelButton() {
    return
      Container(
        // ignore: deprecated_member_use
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)
          ),
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.indigoAccent, fontSize: 20),
          ),

          onPressed: (){

            Navigator.of(context).pop();
          },
        ),
      );
  }






  }




