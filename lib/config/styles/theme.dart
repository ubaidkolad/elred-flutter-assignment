import 'package:flutter/material.dart';

final themeData = ThemeData(
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF325398),
    primaryColorLight: const Color(0xFF3f5fa4),
    primaryColorDark: const Color(0xFF0e2158),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.w200),
        headline3: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w300),
        headline4: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
        subtitle1: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
        subtitle2: TextStyle(
            color: Colors.white54, fontWeight: FontWeight.w300, fontSize: 14),
        caption: TextStyle(
            color: Colors.white54, fontWeight: FontWeight.w200, fontSize: 12),
        headline2: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)));
