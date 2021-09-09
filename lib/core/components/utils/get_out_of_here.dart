import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/utils/adaptive_dialoger.dart';

void getOutOfHere(BuildContext context) {
  FocusScope.of(context).unfocus();
  Navigator.of(context).pop();
}

Future<void> showSureThenQuit({required BuildContext context, required String title, required String message}) async {
  OkCancelResult result = await showSureDialog(context: context, title: title, message: message);

  if (result == OkCancelResult.ok) {
    getOutOfHere(context);
  }
}

Future<OkCancelResult> showSureDialog({required BuildContext context, required String title, required String message}) async {
  return await AdaptiveDialoger.showSimpleOkCancel(
    context: context,
    title: title,
    message: message,
  );
}
