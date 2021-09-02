import 'package:flutter/material.dart';
import 'progress_icon_provider.dart';

Image statusIcon(int myIndex, int stateIndex) {
  if (myIndex < stateIndex)
    return progressIcon(ProgresStatus.PREVIUS);
  else if (myIndex == stateIndex) {
    return progressIcon(ProgresStatus.CURRENT);
  } else {
    return progressIcon(ProgresStatus.FUTURE);
  }
}
