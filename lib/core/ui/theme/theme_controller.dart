import 'package:flutter/material.dart';
import '../../structure/utils/enums/theme_types.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeController {
  ThemeData getTheme(ThemeType type) {
    switch (type) {
      case ThemeType.LIGHT:
        return lightTheme;
      case ThemeType.DARK:
        return darkTheme;
    }
  }
}
