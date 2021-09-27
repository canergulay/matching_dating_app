import 'package:flutter/material.dart';
import 'package:matchangoo/core/appetizers/enums.dart/dialog_type_enum.dart';
import 'package:matchangoo/core/components/buttons/small_animated_icon.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/constants/design_constants.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedbox_extension.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';

class CustomAlertDialog extends Dialog {
  final String title;
  final String message;
  final BuildContext context;
  final DialogType dialogType;
  CustomAlertDialog(this.context, {double elevation = 24, required this.dialogType, required this.title, required this.message})
      : super(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignConstant.shared.borderRadiusHigh)),
            elevation: elevation,
            child: dialogChild(context, title, message, dialogType),
            insetPadding: const EdgeInsets.all(20));
}

Stack dialogChild(BuildContext context, String title, String message, DialogType dialogType) {
  return Stack(alignment: Alignment.center, children: [
    contentsColumn(context, title, message, dialogType),
    Positioned(right: 13, top: 13, child: xCloseButton(context)),
  ]);
}

SmallAnimatedIcon xCloseButton(
  BuildContext context,
) {
  return SmallAnimatedIcon(
    assetPath: AssetPaths.shared.DELPHOTO,
    onTap: () {
      Navigator.of(context).pop();
    },
    scale: 1.7,
  );
}

Column contentsColumn(BuildContext context, String title, String message, DialogType dialogType) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox().heightSpacer(context, 3),
      dialogIcon(dialogType),
      const SizedBox().heightSpacer(context, 4),
      headLineEight(context, title),
      const SizedBox().heightSpacer(context, 2),
      Padding(
        padding: EdgeInsets.all(context.heightUnit * 3),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox().heightSpacer(context, 2),
    ],
  );
}

Image dialogIcon(DialogType type) {
  return Image.asset(
    imagePath(type),
    scale: 0.75,
  );
}

String imagePath(DialogType type) {
  if (type == DialogType.success) {
    return AssetPaths.shared.STATUS_PREVIOUS;
  } else if (type == DialogType.info) {
    return AssetPaths.shared.STATUS_FUTURE;
  } else {
    return AssetPaths.shared.STATUS_CURRENT;
  }
}
