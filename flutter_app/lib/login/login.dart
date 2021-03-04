
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app/base.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/fancy_dialog.dart';
import 'package:flutter_app/navigation_home_screen.dart';
import 'package:flutter_app/post_model.dart';
import 'package:flutter_app/post_service.dart';

class LoginPage extends StatefulWidget {
  final arguments;
  LoginPage({Key key, this.arguments}) : super(key: key);

  @override
  _DyLoginPage createState() => _DyLoginPage(arguments);
}

class _DyLoginPage extends State<LoginPage> with Base {
  final _routeProp;
  String _phoneNumber = '86';
  int type = 3; // 0:注册, 1:手机号码+密码登录, 2:手机号码+验证码登录, 3:昵称登录

  _DyLoginPage(this._routeProp) {
    switch(_routeProp['type']) {
      case 'signIn':
        type = 1;
        break;
      case 'signUp':
        type = 0;
        break;
    }
  }

  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }



  void _changePhoneLogin() {
    setState(() {
      type = type == 2 ? 1 : 2;
    });
  }

  void _changeNickNameLogin() {
    setState(() {
      type = type == 3 ? 1 : 3;
    });
  }

  void _changeSignup() {
    setState(() {
      type = type == 0 ? 1 : 0;
    });
  }





  @override
  Widget build(BuildContext context) {


    String title;
    switch(type) {
      case 0:
        title = 'register';
        break;
      case 1:
      case 2:
        title = 'telephone';
        break;
      case 3:
        title = 'nickName';
        break;
    }
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title:Text(title),
          titleSpacing: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              color: Colors.white,
              child: Center(
                child: Image.asset('assets/images/tab_1.png',
                  width: dp(20),
                    height: dp(20)
                ),
              ),
            ),
          ),
          elevation: 0,
          actions: <Widget>[
            type != 0 ? GestureDetector(
              onTap: _changeNickNameLogin,
              child: Row(
                children: <Widget>[
                  Text(type == 3 ? 'telephoneNumber' : 'Nickname'),
                  Padding(padding: EdgeInsets.only(left: dp(20)),)
                ],
              ),
            ) : SizedBox(),
          ],
        ),
        preferredSize: Size.fromHeight(dp(55)),
      ),
      backgroundColor: Color(0xffeeeeee),
      body: Padding(
        padding: EdgeInsets.only(left: dp(18), right: dp(18)),
        child: Column(
          children: <Widget>[
            type != 3 ? Container(
              margin: EdgeInsets.only(top: dp(18)),
              height: dp(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: dp(20)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text('+$_phoneNumber',
                        textAlign: TextAlign.center,

                        style: TextStyle(color: Colors.black,
                          fontSize: 20.0,),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Color(0xff999999), width: dp(1))),
                        ),
                        child: TextField(
                          controller: _mobileController,
                          inputFormatters:  [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                          cursorColor: Base.defaultColor,
                          cursorWidth: 1.5,
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.only(left: dp(15), top: dp(3), bottom: dp(3)),
                            hintText: 'enter telephone',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ) : Container(
              margin: EdgeInsets.only(top: dp(18)),
              height: dp(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: dp(20), right: dp(20)),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/images/tab_1.png',
                      height: dp(30),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: TextField(
                          controller: _nickNameController,
                          inputFormatters:  [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                          cursorColor: Base.defaultColor,
                          cursorWidth: 1.5,
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.only(left: dp(15), top: dp(3), bottom: dp(3)),
                            hintText: 'nickname',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            type != 2 ? Container(
              margin: EdgeInsets.only(top: dp(18)),
              height: dp(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: dp(20), right: dp(20)),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/images/tab_1.png',
                      height: dp(30),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: TextField(
                          controller: _passWordController,
                          inputFormatters:  [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            //TODO: restrict
                          ],
                          obscureText: true,
                          cursorColor: Colors.lightBlueAccent,
                          cursorWidth: 1.5,
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.only(left: dp(15), top: dp(3), bottom: dp(3)),
                            hintText: 'password',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ) : SizedBox(),
            type == 2 || type == 0 ? Container(
              margin: EdgeInsets.only(top: dp(18)),
              height: dp(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: dp(20), right: dp(5)),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/images/tab_1.png',
                      height: dp(20),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: TextField(
                          controller: _codeController,
                          inputFormatters:  [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          cursorColor: Base.defaultColor,
                          cursorWidth: 1.5,
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.only(left: dp(15), top: dp(3), bottom: dp(3)),
                            hintText: 'code',
                          ),
                        ),
                      ),
                    ),
                    RawMaterialButton(
                      constraints: BoxConstraints(maxHeight: dp(30), minWidth: dp(100)),
                      fillColor: Colors.lightBlueAccent,
                      elevation: 0,
                      highlightElevation: 0,
                      highlightColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      onPressed: () {
                        //TODO: ?
                      },
                      child: Center(
                        child: Text('text',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ) : SizedBox(),
            Padding(padding: EdgeInsets.only(top: dp(30)),),
            RawMaterialButton (
              constraints: BoxConstraints(minHeight: 50,maxWidth: 200),
              fillColor: Colors.lightBlueAccent,
              elevation: 0,
              highlightElevation: 0,
              highlightColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              onPressed: () {

                checkUser();
                //   Navigator.of(context).push(
                //       MaterialPageRoute(
                //       builder: (context)=>NavigationHomeScreen()
                //       )
                //   );


                // else {
                //   showDialog(
                //       context: context,
                //       builder: (BuildContext context) => FancyDialog(
                //       )
                //   );
                // }
              },
              child: Center(
                child: Text(type == 0 ? 'register' : 'login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: dp(10)),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                type != 0 ? GestureDetector(
                  onTap: _changePhoneLogin,
                  child: Text(type == 2 ? 'password' : 'code',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19
                    ),
                  ),
                ) : SizedBox(),
                GestureDetector(
                  onTap: _changeSignup,
                  child: Text(type == 0 ? 'Login' : 'Register',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Color(0xffff7701),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


   void checkUser(){

    print(_mobileController.text);
    print(_passWordController.text);

    createPost1(new Post1(username:_mobileController.text,password:_passWordController.text)).then((response) {
      if (response.statusCode >= 200) {
        var _content = response.body;
        Map<String, dynamic> enter = jsonDecode(_content);
        print('${enter['result']}');
        print(enter['result']);
        if(enter['result']==true){
          Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context)=>NavigationHomeScreen()
                  )
              );
        }

        else {
          showDialog(
                  context: context,
                  builder: (BuildContext context) => FancyDialog()
              );
        }


      }
      else
        print(response.statusCode);
    } ).catchError((error){
      print('error : $error');
    });
  }
}
