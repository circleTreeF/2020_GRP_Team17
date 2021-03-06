import 'package:flutter/material.dart';
import 'package:flutter_app/login/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text_input.dart';


class UserText extends StatelessWidget {

  bool passwordInvisible = true;

  TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;


  @override
  Widget build(BuildContext context) {
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

}
