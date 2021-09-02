import 'package:flutter/material.dart';
import '../../../../core/ui/theme/palette.dart';

Container araLine({required int myIndex, required int stateIndex}) {
  return Container(
    height: 1,
    color: lineColor(myIndex, stateIndex),
  );
}

Color lineColor(int myIndex, int stateIndex) {
  if (myIndex < stateIndex) {
    return Palette.MPINK;
  } else {
    return Colors.grey.withOpacity(0.3);
  }
}
