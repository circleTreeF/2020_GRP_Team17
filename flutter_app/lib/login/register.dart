import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/fancy_dialog.dart';
import 'package:flutter_app/database/model/post_model.dart';
import 'package:flutter_app/database/controller/post_service.dart';
import 'package:flutter_app/login/widgets/custom_text_input.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_screen.dart';





class RegisterScreen extends StatefulWidget {



  @override
  _RegisterScreenState createState() => _RegisterScreenState();


}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = ScrollController();
  double offset = 0;

  TextEditingController nameController = TextEditingController();

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
                            color: kPrimaryColor,
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

  void addUser() {
    print(nameController.text);
    print(passwordController.text);
    createPost3(new Post1(username:nameController.text,password:passwordController.text)).then((response) {
      if (response.statusCode >= 200) {
        var _content = response.body;
        print(_content);
        Map<String, dynamic> enter = jsonDecode(_content); // print(enter);
        print('${enter['result']}');
        print(enter['result']);
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


  Widget userText() {
    return new Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextInput(
              textEditController: nameController,
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
              textEditController: passwordController,
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







}
