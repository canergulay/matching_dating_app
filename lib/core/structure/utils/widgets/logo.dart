import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import '../../../constants/asset_paths.dart';
import '../extensions/sizedbox_extension.dart';
import '../extensions/textstyle_extension.dart';
import '../../../ui/theme/palette.dart';
import '../extensions/context_extension.dart';

Column matchifyLogo(BuildContext context) => Column(
      children: [
        const SizedBox().heightSpacer(context, 8),
        logo(),
        const SizedBox().heightSpacer(context, 1),
        matchify(context),
      ],
    );

Image logo() => Image.asset(
      AssetPaths.LOGO,
      scale: 5,
    );

Row matchifyLogoWithBackButtonWcustomPress({required BuildContext context, required VoidCallback onTap}) => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnimatorButton(
          onPressed: onTap,
          childToBeAnimated: Image.asset(
            AssetPaths.BACKBUTTON,
            width: context.heightUnit * 6,
            height: context.heightUnit * 6,
          ),
        ),
        Column(
          children: [
            const SizedBox().heightSpacer(context, 8),
            Image.asset(
              AssetPaths.LOGO,
              scale: 2,
            ),
            const SizedBox().heightSpacer(context, 1),
            matchify(context),
          ],
        ),
        Container(
          width: context.heightUnit * 6,
          height: context.heightUnit * 6,
        )
      ],
    );

Row matchifyLogoWithBackButton(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop();
          },
          child: Image.asset(
            AssetPaths.BACKBUTTON,
            width: context.heightUnit * 6,
            height: context.heightUnit * 6,
          ),
        ),
        Column(
          children: [
            const SizedBox().heightSpacer(context, 8),
            Image.asset(
              AssetPaths.LOGO,
              scale: 2,
            ),
            const SizedBox().heightSpacer(context, 1),
            matchify(context),
          ],
        ),
      ],
    );

RichText matchify(BuildContext context) => RichText(
    text: TextSpan(
        text: 'matchi',
        children: [TextSpan(text: 'fy', style: logoTextStyle(context, Palette.MBLUE))],
        style: logoTextStyle(context, Palette.MPINK)));

TextStyle logoTextStyle(BuildContext context, Color color) =>
    Theme.of(context).textTheme.headline4?.dynamicText(context: context, size: 7).copyWith(color: color) ?? const TextStyle();
