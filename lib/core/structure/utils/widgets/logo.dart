import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/textstyle_extension.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';

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

RichText matchify(BuildContext context) => RichText(
    text: TextSpan(
        text: 'matchi',
        children: [TextSpan(text: 'fy', style: logoTextStyle(context, Palette.MPINK))],
        style: logoTextStyle(context, Palette.MBLUE)));

TextStyle logoTextStyle(BuildContext context, Color color) =>
    Theme.of(context).textTheme.headline4?.dynamicText(context: context, size: 7).copyWith(color: color) ?? TextStyle();
