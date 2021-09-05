import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveDialoger {
  static Future<OkCancelResult> showSimpleOkCancel({required BuildContext context, required String title, required String message}) async {
    return await showOkCancelAlertDialog(context: context, message: message, title: title);
  }
}
