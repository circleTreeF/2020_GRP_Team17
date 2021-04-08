import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///This class is a stateful widget for user to input the [username] and [password]
class UserText extends StatefulWidget {
  const UserText(
      {
      @required this.hintTextString,
      @required this.textEditController,
      @required this.inputType,
      this.enableBorder = true,
      this.themeColor,
      this.radius,
      this.maxLength,
      this.prefixIcon,
      this.textColor,
      this.errorMessage,
      this.labelText});


  final hintTextString;
  final TextEditingController textEditController;
  final InputType inputType;
  final bool enableBorder;
  final Color themeColor;
  final double radius;
  final int maxLength;
  final Widget prefixIcon;
  final Color textColor;
  final String errorMessage;
  final String labelText;

  @override
  UserTextState createState() => UserTextState();
}

/// This class describe the state of this input text field.
class UserTextState extends State<UserText> {
  bool _isValidate = true;
  String validationMessage = '';
  bool visibility = false;
  int oldTextSize = 0;

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/12 2:39 PM
  *** @version:1.2
  **/
  /// build method for UI rendering
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextField(
        controller: widget.textEditController,
        decoration: InputDecoration(
          hintText: widget.hintTextString as String,
          errorText: _isValidate ? null : validationMessage,
          border: getBorder(),
          labelText: widget.labelText ?? widget.hintTextString as String,
          labelStyle: getTextStyle(),
          prefixIcon: widget.prefixIcon ?? getPrefixIcon(),
          suffixIcon: getSuffixIcon(),
          enabledBorder: widget.enableBorder ? getBorder() : InputBorder.none,
          focusedBorder: widget.enableBorder ? getBorder() : InputBorder.none,
        ),
        keyboardType: TextInputType.text,
        obscureText: widget.inputType == InputType.Password && !visibility,

        style: TextStyle(
          color: widget.textColor ?? Colors.black,
        ),

      ),
    );
  }


  /**
   *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
   *** @date: 2021/3/12 2:38 PM
   *** @version:1.0
   **/
  ///Return the OutlineInputBorder
  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 12.0)),
      borderSide: BorderSide(width: 2, color: widget.themeColor ?? Theme.of(context).primaryColor),
      gapPadding: 2,
    );
  }



  /**
   *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
   *** @date: 2021/3/12 2:38 PM
   *** @version:1.0
   **/
  /// Return text style.
  TextStyle getTextStyle() {
    return TextStyle(color: widget.themeColor ?? Theme.of(context).primaryColor);
  }


  /**
   *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
   *** @date: 2021/3/12 2:38 PM
   *** @version:1.0
   **/

  /// Return prefix Icon
  Icon getPrefixIcon() {
    switch (widget.inputType) {
      case InputType.username:
        return Icon(
          Icons.person,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.Password:
        return Icon(
          Icons.lock,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      default:
        return Icon(
          Icons.person,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        );
        break;
    }
  }

  /**
  *** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
  *** @date: 2021/3/12 2:38 PM
  *** @version:1.0
  **/
  /// Return suffix icon
  Widget getSuffixIcon() {
    if (widget.inputType == InputType.Password) {
      return IconButton(
        onPressed: () {
          visibility = !visibility;
          setState(() {});
        },
        icon: Icon(
          visibility ? Icons.visibility : Icons.visibility_off,
          color: widget.themeColor ?? Theme.of(context).primaryColor,
        ),
      );
    } else {
      return const Opacity(opacity: 0, child: Icon(Icons.phone));
    }
  }
}


/**
*** @author: Shengnan HU ID: 20126376 Email: scysh1@nottingham.edu.cn
*** @date: 2021/3/01 2:37 PM
*** @version:1.0
**/
/// Enums for input types
enum InputType { username, Password }
