import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey.shade400,
    ));
