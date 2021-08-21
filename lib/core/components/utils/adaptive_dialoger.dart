import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveDialoger {
  void showBasicAdaptiveAlert(BuildContext context, String title, String message) {
    showOkAlertDialog(context: context, title: title, message: message);
  }
}
