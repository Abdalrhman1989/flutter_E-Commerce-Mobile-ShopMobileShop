import 'package:flutter/material.dart';

class MainTheme {
  ThemeData mobileThemeData() {
    return ThemeData(
      fontFamily: 'Muli',
      primaryColor: Colors.white,
      brightness: Brightness.light,
      accentColor: Colors.redAccent,
      dividerColor: Colors.redAccent,
      focusColor: Colors.redAccent,
      hintColor: Colors.redAccent,
      textTheme: TextTheme(
        headline4: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: Colors.redAccent,
          height: 1.3,
        ),
        headline2: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Colors.redAccent,
          height: 1.4,
        ),
        headline3: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 1.3,
        ),
        subtitle2: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          height: 1.3,
        ),
        caption: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: Colors.grey,
          height: 1.2,
        ),
      ),
    );
  }
}
