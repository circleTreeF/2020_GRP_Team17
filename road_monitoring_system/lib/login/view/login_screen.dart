import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_monitoring_system/database/controller/post.dart';
import 'package:road_monitoring_system/database/model/User.dart';
import 'package:road_monitoring_system/login/view/register_screen.dart';
import 'package:road_monitoring_system/login/widgets/custom_text_input.dart';
import 'package:road_monitoring_system/login/widgets/header.dart';
import 'package:road_monitoring_system/utils/constant.dart';

import 'login_fail_page.dart';
import '../../home/navigation_home_screen.dart';
import '../model/user_account.dart';




/// This class is for generating the user login page.
class LoginScreen extends StatefulWidget {

  @override
  LoginScreenState createState() => LoginScreenState();

}
///The state of this user login page
class LoginScreenState extends State<LoginScreen> {

  final controller = ScrollController();
  double offset = 0;

  ///The visibility of password
  bool passwordInvisible = true;

  ///The controller for the editable text field for entering the [username].
  TextEditingController nameController = TextEditingController();
  /// The controller for the editable text field for entering the [password].
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: SingleChildScrollView(

        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  userText(),//text field of username and password
                  SizedBox(height: ScreenUtil.getInstance().setHeight(70)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(600),
                          height: ScreenUtil.getInstance().setHeight(80),
                          decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(30.0),
                             ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                checkUser();
                              },
                              child: Center(
                                child: Text("Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(200),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Do not have an Account? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {

                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)=>RegisterScreen()
                              )
                          );//;

                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Color(0xFF5d74e3),
                                fontFamily: "Poppins-Bold")),

                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/14 8:47 PM
  *** @version:1.0
  **/

/// Returns the widget of the text field
  Widget userText() {
    return new Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserText(
              textEditController: nameController,
              hintTextString: 'Enter User name',
              inputType: InputType.username,
              enableBorder: true,
              themeColor: Theme.of(context).primaryColor,
              radius: 50.0,
              maxLength: 24,
              prefixIcon: Icon(Icons.person, color: Theme.of(context).primaryColor),
              textColor: Colors.black,
              errorMessage: 'User name cannot be empty',
              labelText: 'User Name',
            ),
            SizedBox(height: ScreenUtil.getInstance().setHeight(35),),
            UserText(
              textEditController: passwordController,
              hintTextString: 'Enter Password',
              inputType: InputType.Password,
              enableBorder: true,
              radius: 50.0,
              maxLength: 16,
              prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }


  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/16 8:49 PM
  *** @version:2.0
  **/

  ///Checks whether the [username] and [password] users entered are available.
  ///
  /// Make http [POST] request
  /// If they are valid, update the [UserAccount] and push the page to Home page.
  /// If they are invalid, pop up the dialog to alert the users that they have entered the wrong [username] or [password]
  ///
  void checkUser() {

    createPostToLogin(new User(username:nameController.text,password:passwordController.text)).then((response) {
      if (response.statusCode >= 200) {
        var _content = response.body;

        Map<String, dynamic> enter = json.decode(_content);

        if(enter['result']==true){
           UserAccount().user_id=enter['data'][0]['id'];
           UserAccount().username=enter['data'][0]['username'];


          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context)=>NavigationHomeScreen()
              )
          );
        }
        else {
          showDialog(
              context: context,
              builder: (BuildContext context) => PopUpPageForLoginFail()
          );
        }

      }
      else
        print(response.statusCode);
    }
    ).catchError((error){
      print('error : $error');
    });
  }










}
