import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
      fontFamily: 'Schyler',
    primaryColor: primaryColor,

    accentColor: Color(0xffC2E8FF),
    backgroundColor: primaryColor,
    textTheme: TextTheme(
      headline4: TextStyle(
          fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText1: TextStyle(
          fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(
          fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(fontSize: 11.0, color: Colors.white),
    ));