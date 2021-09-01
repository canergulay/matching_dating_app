import 'package:flutter/material.dart';

class FocusNoder {
  final FocusNode focusNode0 = FocusNode();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  FocusNode myFocus(int currentfield) {
    switch (currentfield) {
      case 0:
        return focusNode0;
      case 1:
        return focusNode1;
      case 2:
        return focusNode2;
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

      default:
        return focusNode2;
    }
  }

  FocusNode nextFocus(int currentfield) {
    switch (currentfield) {
      case 0:
        return focusNode1;
      case 1:
        return focusNode2;
      default:
        return focusNode0;
    }
  }
}
