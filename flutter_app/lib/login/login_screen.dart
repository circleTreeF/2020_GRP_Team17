import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/fancy_dialog.dart';
import 'package:flutter_app/login/register.dart';
import 'package:flutter_app/login/model/user_account.dart';
import 'package:flutter_app/login/widgets/custom_text_input.dart';
import 'package:flutter_app/login/widgets/header.dart';
import 'package:flutter_app/navigation_home_screen.dart';
import 'package:flutter_app/database/model/post_model.dart';
import 'package:flutter_app/database/controller/post_service.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class LoginScreen extends StatefulWidget {



  @override
  _LoginScreenState createState() => _LoginScreenState();


}

class _LoginScreenState extends State<LoginScreen> {
  final controller = ScrollController();
  double offset = 0;
  bool passwordInvisible = true;

  TextEditingController _nameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();


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
                              color: kPrimaryColor,
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

  Widget userText() {
    return new Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextInput(
              textEditController: _nameController,
              hintTextString: 'Enter User name',
              inputType: InputType.Default,
              enableBorder: true,
              themeColor: Theme
                  .of(context)
                  .primaryColor,
              cornerRadius: 48.0,
              maxLength: 24,
              prefixIcon: Icon(Icons.person, color: Theme
                  .of(context)
                  .primaryColor),
              textColor: Colors.black,
              errorMessage: 'User name cannot be empty',
              labelText: 'User Name',
            ),
            SizedBox(height: ScreenUtil.getInstance().setHeight(35),),
            CustomTextInput(
              textEditController: _passwordController,
              hintTextString: 'Enter Password',
              inputType: InputType.Password,
              enableBorder: true,
              cornerRadius: 48.0,
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


  //TODO: split to another file
  void checkUser() {
    print(_nameController.text);
    print(_passwordController.text);
    createPost1(new Post1(username:_nameController.text,password:_passwordController.text)).then((response) {
      if (response.statusCode >= 200) {
        var _content = response.body;
        Map<String, dynamic> enter = jsonDecode(_content);
        print('${enter['result']}');
        print(enter['result']);
        if(enter['result']==true){
           UserAccount().user_id=int.parse(_nameController.text);
          print(UserAccount().user_id);
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
