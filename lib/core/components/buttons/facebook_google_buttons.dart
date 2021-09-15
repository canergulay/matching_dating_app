import 'package:flutter/material.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/facebook_google_buttons.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';

Row facegoogleButtons(BuildContext context, {required VoidCallback googleOnTap, required VoidCallback facebookOnTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AnimatedFacebookGoogleButton(onTap: googleOnTap, type: ButtonType.GOOGLE),
      const SizedBox().widthSpacer(context, 3),
      AnimatedFacebookGoogleButton(onTap: facebookOnTap, type: ButtonType.FACEBOOK)
    ],
  );
}
