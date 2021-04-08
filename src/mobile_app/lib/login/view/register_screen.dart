import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_monitoring_system/database/controller/post.dart';
import 'package:road_monitoring_system/database/model/User.dart';
import 'package:road_monitoring_system/login/widgets/custom_text_input.dart';
import 'package:road_monitoring_system/utils/constant.dart';

import 'register_fail_page.dart';
import 'login_screen.dart';




/// This class is for generating the user register page.

class RegisterScreen extends StatefulWidget {


  @override
  RegisterScreenState createState() => RegisterScreenState();


}
///The state of this user register page
class RegisterScreenState extends State<RegisterScreen> {
  final controller = ScrollController();
  double offset = 0;


  ///The controller for the editable text field for entering the [username].
  TextEditingController nameController = TextEditingController();
  /// The controller for the editable text field for entering the [password].
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(400),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  userText(),
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
                                addUser();
                              },
                              child: Center(
                                child: Text("Register",
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

  ///Create a new account by adding the available [username] and [password] users entered to database.
  ///
  /// Make http [POST] request
  /// If the username is valid, update the [UserAccount] and push the page to Home page.
  /// If the username is existing, pop up the dialog to alert the users that they have entered the exiting [username].
  ///
  void addUser() {

    createPostToRegister(new User(username:nameController.text,password:passwordController.text)).then((response) {
      if (response.statusCode >= 200) {
        var _content = response.body;

        Map<String, dynamic> enter = jsonDecode(_content); // print(enter);

        if(enter['result']==true){

          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context)=>LoginScreen()
              )
          );
        }
        else {
          showDialog(
              context: context,
              builder: (BuildContext context) => PopUpPageForRegisterFail()
          );
        }

      }
      else
        print(response.statusCode);
    } ).catchError((error){
      print('error : $error');
    });
  }


  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/21 8:58 PM
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
              themeColor: Theme
                  .of(context)
                  .primaryColor,
              radius: 50.0,
              maxLength: 20,
              prefixIcon: Icon(Icons.person, color: Theme
                  .of(context)
                  .primaryColor),
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
              maxLength: 20,
              prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }







}
