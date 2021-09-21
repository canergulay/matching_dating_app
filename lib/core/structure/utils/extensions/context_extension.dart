import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension DynamicSizeExtenson on BuildContext {
  double get dynamicHeight => _dynamicHeighter();
  double get dynamicWidth => _dynamicWidther();

  double _dynamicHeighter() {
    if (height > width) {
      return height;
    } else {
      return width;
    }
  }

  double _dynamicWidther() {
    if (height > width) {
      return width;
    } else {
      return height;
    }
  }
}

extension SizeUnitExtension on BuildContext {
  double get heightUnit => dynamicHeight / 100;
  double get widthUnit => dynamicWidth / 100;
}

extension LimitedSizeUnitExtension on BuildContext {
  double get limitedheightUnit => dynamicHeight / 100 < 10 ? dynamicHeight / 100 : 10;
  double get limitedwidthUnit => dynamicWidth / 100 < 10 ? dynamicHeight / 100 : 10;
}
