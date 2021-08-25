import 'package:flutter/material.dart';

extension FocusNext on BuildContext {
  void nextEditableTextFocus() {
    FocusScope.of(this).nextFocus();
  }

  void finishAndUnfocus() {
    FocusScope.of(this).unfocus();
  }
}
