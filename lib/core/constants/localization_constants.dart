import 'package:flutter/material.dart';

class LocalizationConstants {
  static const String localizationPath = 'assets/lang';

  static const Locale tr = Locale('tr', 'TR');
  static const Locale en = Locale('en', 'EN');

  static const Locale fallBackLocale = Locale('en', 'EN');

  static const List<Locale> supportedLocales = [tr, en];
}
