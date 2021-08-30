import 'package:flutter/material.dart';
import '../../../constants/asset_paths.dart';
import '../extensions/sizedBox_extension.dart';
import '../extensions/textstyle_extension.dart';
import '../../../ui/theme/palette.dart';
import '../extensions/context_extension.dart';

Column matchifyLogo(BuildContext context) => Column(
      children: [
        SizedBox().heightSpacer(context, 8),
        Image.asset(
          AssetPaths.LOGO,
          scale: 2,
        ),
        SizedBox().heightSpacer(context, 1),
        matchify(context),
      ],
    );

Row matchifyLogoWithBackButton(BuildContext context) => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            SizedBox().heightSpacer(context, 3),
            Image.asset(
              AssetPaths.LOGO,
              scale: 2,
            ),
            SizedBox().heightSpacer(context, 1),
            matchify(context),
          ],
        ),
        Container(
          width: context.heightUnit * 6,
          height: context.heightUnit * 6,
        )
      ],
    );

RichText matchify(BuildContext context) => RichText(
    text: TextSpan(
        text: 'matchi',
        children: [TextSpan(text: 'fy', style: logoTextStyle(context, Palette.MBLUE))],
        style: logoTextStyle(context, Palette.MPINK)));

TextStyle logoTextStyle(BuildContext context, Color color) =>
    Theme.of(context).textTheme.headline4?.dynamicText(context: context, size: 7).copyWith(color: color) ?? TextStyle();
