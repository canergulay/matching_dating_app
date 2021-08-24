import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle dynamicText({required double size, required double widthUnit}) {
    return this.copyWith(fontSize: size * widthUnit);
  }
}
