import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'localization_constants.dart';

Widget localizationInitializer(Widget child) => EasyLocalization(
      child: child,
      supportedLocales: LocalizationConstants.supportedLocales,
      path: LocalizationConstants.localizationPath,
      fallbackLocale: LocalizationConstants.fallBackLocale,
    );
