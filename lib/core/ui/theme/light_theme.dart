import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFFBFAF5),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey.shade400,
    ));
