import 'package:flutter/material.dart';

import 'app_theme.dart';

// Colors
const defaultColor = Color(0xFF3382CC);




// Text Style
///signOut Text Style
const signOutTextStyle =TextStyle(
  fontFamily: AppTheme.fontName,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: AppTheme.darkText,
);

///userName Text Style
const userNameTextStyle =TextStyle(
  fontWeight: FontWeight.w600,
  color: AppTheme.grey,
  fontSize: 20,
);

///ExistingUserName TextStyle
const existingUserNameTextStyle =TextStyle(
    fontFamily: "Poppins-Bold",
    color: Colors.indigoAccent,
    fontSize: 20,
    fontWeight: FontWeight.bold
);

///wrongUsernameOrPassword Text Style
const wrongUsernameOrPassword =TextStyle(
    fontFamily: "Poppins-Bold",
    color: Colors.indigoAccent,
    fontSize: 20,
    fontWeight: FontWeight.bold
);

const scoreTextStyle =TextStyle(
    fontFamily: "Poppins-Bold",
    color: Colors.black,
    fontSize: 80,
    fontWeight: FontWeight.bold
);