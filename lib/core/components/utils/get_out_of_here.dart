import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/utils/adaptive_dialoger.dart';

void getOutOfHere(BuildContext context) {
  FocusScope.of(context).unfocus();
  Navigator.of(context).pop();
}

Future<void> showSureThenQuit({required BuildContext context}) async {
  OkCancelResult result = await showSureDialog(context: context);

  if (result == OkCancelResult.ok) {
    getOutOfHere(context);
  }
}

Future<OkCancelResult> showSureDialog({required BuildContext context}) async {
  return await AdaptiveDialoger.showSimpleOkCancel(
    context: context,
    title: "Are you sure?",
    message: "You will lose registration process once you leave this page.",
  );
}
