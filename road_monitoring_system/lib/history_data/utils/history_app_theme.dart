import 'package:flutter/material.dart';

class HistoryTheme {

  static ThemeData buildInterfaceTheme() {
    final Color primaryColor = Color.fromRGBO(27,42,107,1.0);
    final Color secondaryColor = Colors.blueGrey;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      backgroundColor: const Color(0xFFFFFFFF),
    );
  }
}
