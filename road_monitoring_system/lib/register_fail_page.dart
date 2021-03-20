


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class PopUpPageForRegisterFail extends StatefulWidget {
  const PopUpPageForRegisterFail(
      {Key key,
        this.okFun,
        this.cancelFun,
        this.animationType = -2,
        this.cancelColor = Colors.blueAccent,
        this.okColor = Colors.blueAccent,
        this.ok = " OK !",
        this.cancel = "Cancel",
        this.theme = 0 //default theme is fancy
      })
      : super(key: key);


  final Function okFun;
  final Function cancelFun;
  final int animationType;
  final Color okColor;
  final Color cancelColor;
  final String ok;
  final String cancel;
  final int theme; // 0:

  @override
  PopUpPageForRegisterFailState createState() {
    return PopUpPageForRegisterFailState();
  }
}

class PopUpPageForRegisterFailState extends State<PopUpPageForRegisterFail> with TickerProviderStateMixin {
  AnimationController ac;
  Animation animation;
  double width;
  double height;
  int animationAxis = 0; // 0 for x 1 for y


  Function okFun;
  Function cancelFun;

  Color okColor;
  Color cancelColor;
  String ok;
  String cancel;
  int theme;
  int package = 0; //0 user assets ,1 package assets
  String mark="D";
  int rank;
  Map<String,DateTime> time;

  @override
  void initState() {





    okFun = widget.okFun;
    cancelFun = widget.cancelFun;
    okColor = widget.okColor;
    cancelColor = widget.cancelColor;

    ok = widget.ok;
    cancel = widget.cancel;
    theme = widget.theme;


    double start;
    int animationType = widget.animationType;
    switch (animationType) {
      case 1:
        {
          start = -1.0;
          break;
        }
      case -1:
        {
          start = 1.0;
          break;
        }
      case 2:
        {
          start = -1.0;
          break;
        }
      case -2:
        {
          start = 1.0;
          break;
        }
    }
    if (animationType.abs() == 2) animationAxis = 1;
    ac =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animation = Tween(begin: start, end: 0.0)
        .animate(CurvedAnimation(parent: ac, curve: Curves.easeIn));
    animation.addListener(() {
      setState(() {});
    });

    ac.forward();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var dialogWidth = 0.8 * height;
    var dialogHeight = 0.8 * width;

    // assert(MediaQuery.maybeOf(context) != null,'\n****context does not contain media query object***\n');


    var image = ClipRRect(
      child: Image.asset(
         "assets/images/logo.png",
        fit: BoxFit.fill,
        width: dialogWidth * 0.25, // dialogWidth will get left/right margin?
        height: dialogHeight * 0.36,

      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(theme == 0 ? 15 : 0),
          topRight: Radius.circular(theme == 0 ? 15 : 0)),
    );

    return GestureDetector(
      onTap: (){Navigator.of(context).pop();},
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: dialogWidth,
          height: dialogHeight,
          transform: Matrix4.translationValues(
              animationAxis == 0 ? animation.value * width : 0,
              animationAxis == 1 ? animation.value * width : 0,
              0
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(theme == 0 ? 15 : 0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              image,
              SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
              Padding(
                padding: const EdgeInsets.only(left:5,top:12),                                          child: Text(
                'Existing UserName!',
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

                    customButton(ok, okColor),

                  ],
                ),
              )
            ],
          ),
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




