import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:matchangoo/core/appetizers/enums.dart/toast_type_enum.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/ui/components/headlines.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

class GeneralToast extends StatelessWidget {
  final ToastType type;
  final String title;
  final String message;
  const GeneralToast({required this.title, required this.message, required this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.heightUnit * 3),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftBar(context, type: type),
            toastBody(context, type: type, title: title, message: message),
          ],
        ),
      ),
    );
  }

  Container leftBar(BuildContext context, {required ToastType type}) {
    return Container(
      width: 10,
      height: context.heightUnit * 8,
      decoration: BoxDecoration(
          color: toastBarColorGetter(type),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          )),
    );
  }
}

Container toastBody(
  BuildContext context, {
  required ToastType type,
  required String title,
  required String message,
}) {
  return Container(
    width: 370,
    height: context.heightUnit * 8,
    decoration: BoxDecoration(
        color: toastColorGetter(type),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox().widthSpacer(context, 3),
        Image.asset(
          toastIconGetter(type),
          scale: 6,
        ),
        const SizedBox().widthSpacer(context, 3),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headLineEight(context, title, fontWeight: FontWeight.w400),
              Text(message),
            ],
          ),
        ),
        AnimatorButton(
            childToBeAnimated: Text(
              'X',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold, color: toastBarColorGetter(type)),
            ),
            onPressed: () {
              ToastManager().dismissAll(showAnim: true);
            }),
        SizedBox().widthSpacer(context, 3)
      ],
    ),
  );
}

String toastIconGetter(ToastType type) {
  switch (type) {
    case ToastType.good:
      return AssetPaths.shared.GOOD;
    case ToastType.bad:
      return AssetPaths.shared.BAD;
    case ToastType.info:
      return AssetPaths.shared.INFO;
    default:
      return AssetPaths.shared.INFO;
  }
}

Color toastColorGetter(ToastType type) {
  switch (type) {
    case ToastType.good:
      return Palette.TOASTGREENLIGHT;
    case ToastType.bad:
      return Palette.TOASTREDLIGHT;
    case ToastType.info:
      return Palette.TOASTBLUELIGHT;
    default:
      return Palette.TOASTBLUELIGHT;
  }
}

Color toastBarColorGetter(ToastType type) {
  switch (type) {
    case ToastType.good:
      return Palette.TOASTGREENDARK;
    case ToastType.bad:
      return Palette.TOASTREDDARK;
    case ToastType.info:
      return Palette.TOASTBLUEDARK;
    default:
      return Palette.TOASTBLUEDARK;
  }
}
