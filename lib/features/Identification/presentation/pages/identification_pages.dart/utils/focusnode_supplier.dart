import 'package:flutter/material.dart';

class FocusNoder {
  final FocusNode focusNode0 = FocusNode();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();
  final FocusNode focusNode7 = FocusNode();

  FocusNode myFocus(int currentfield) {
    switch (currentfield) {
      case 0:
        return focusNode0;
      case 1:
        return focusNode1;
      case 2:
        return focusNode2;
      case 3:
        return focusNode3;
      case 4:
        return focusNode4;
      case 5:
        return focusNode5;
      case 6:
        return focusNode6;
      case 7:
        return focusNode7;
      default:
        return focusNode0;
    }
  }

  FocusNode previousFocus(int currentfield) {
    switch (currentfield) {
      case 0:
        return focusNode0;
      case 1:
        return focusNode0;
      case 2:
        return focusNode1;
      case 3:
        return focusNode2;
      case 4:
        return focusNode3;
      case 5:
        return focusNode4;
      case 6:
        return focusNode5;
      case 7:
        return focusNode6;
      default:
        return focusNode7;
    }
  }

  FocusNode nextFocus(int currentfield) {
    switch (currentfield) {
      case 0:
        return focusNode1;
      case 1:
        return focusNode2;
      case 2:
        return focusNode3;
      case 3:
        return focusNode4;
      case 4:
        return focusNode5;
      case 5:
        return focusNode6;
      case 6:
        return focusNode7;
      case 7:
        return focusNode7;
      default:
        return focusNode0;
    }
  }
}
