

import 'package:flutter_app/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../navigation_home_screen.dart';

class LoginInitPage  extends StatefulWidget  {
  LoginInitPage({Key key}) : super(key: key);

  @override

    // TODO: implement createState
    _LoginInitPageState createState() => _LoginInitPageState();


}

class _LoginInitPageState extends State<LoginInitPage> with Base{
  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: Base.dessignWidth)..init(context);


    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: dp(320),
            height: dp(430),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: OverflowBox(
              alignment: Alignment.bottomCenter,
              maxHeight: dp(515),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  Positioned(
                    child: Image.asset(
                      'assets/images/tab_1.png',
                      width: dp(220),
                    ),
                  ),
                  Positioned(
                    top: dp(170),
                    left: dp(30),
                    child: Text('Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: dp(100),
                    right: dp(15),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.asset('assets/images/tab_1.png',
                        width: dp(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: dp(30),
                      right: dp(30),
                      top: dp(230),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RawMaterialButton (
                          fillColor: Colors.lightBlueAccent,
                          elevation: 0,
                          highlightElevation: 0,
                          highlightColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/login', arguments: {
                              'type': 'signIn'
                            });
                          },
                          child: Container(
                            height: dp(50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(dp(4))),
                            ),
                            child: Center(
                              child: Text('USER LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: dp(20), bottom: dp(15)),
                          child: RawMaterialButton (
                            fillColor: Colors.white,
                            elevation: 0,
                            highlightElevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, '/login', arguments: {
                                'type': 'signUp'
                              });
                            },
                            child: Container(
                              height: dp(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                border: Border.all(width: dp(1), color: Colors.lightBlueAccent),
                              ),
                              child: Center(
                                child: Text('REGISTER',
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: dp(20), bottom: dp(15)),
                          child: RawMaterialButton (
                            fillColor: Colors.green,
                            elevation: 0,
                            highlightElevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context)=>NavigationHomeScreen()
                                  )
                              );
                            },
                            child: Container(
                              height: dp(50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                border: Border.all(width: dp(1), color: Colors.lightBlueAccent),
                              ),
                              child: Center(
                                child: Text('Test Entrance',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

}


}