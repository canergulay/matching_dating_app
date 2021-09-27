import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/appetizers/enums.dart/dialog_type_enum.dart';
import 'package:matchangoo/core/components/dialogs/error_dialog.dart';

void showCustomInfoAlertDialog(
  BuildContext context, {
  required String title,
  required String message,
  required DialogType dialogType,
}) =>
    showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
              context,
              title: title,
              message: message,
              dialogType: dialogType,
            ));

void showMyDialog({required BuildContext context, required Widget dialogWidget}) {
  showDialog(context: context, builder: (_) => dialogWidget);
}
