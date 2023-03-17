import 'package:flutter/material.dart';

final themeData = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF47529e),
    primaryColorLight: const Color(0xFF2ebaef),
    primaryColorDark: const Color(0xFF0e2158),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.w300),
        headline3: TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
        headline4: TextStyle(
            fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
        subtitle2: TextStyle(
            color: Colors.white54, fontWeight: FontWeight.w300, fontSize: 14),
        caption: TextStyle(
            color: Colors.white54, fontWeight: FontWeight.w200, fontSize: 12),
        headline2: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)));
