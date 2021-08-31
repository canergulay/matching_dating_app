import 'package:flutter/material.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/progress_icon_provider.dart';

Image statusIcon(int myIndex, int stateIndex) {
  if (myIndex < stateIndex)
    return progressIcon(ProgresStatus.PREVIUS);
  else if (myIndex == stateIndex) {
    return progressIcon(ProgresStatus.CURRENT);
  } else {
    return progressIcon(ProgresStatus.FUTURE);
  }
}
