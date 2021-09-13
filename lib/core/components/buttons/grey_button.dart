import 'package:flutter/material.dart';
import '../../ui/theme/palette.dart';

Container greyContainer({
  Color color = Palette.TEXTFIELDGREY,
  double radius = 20,
  Alignment alignment = Alignment.center,
  required Widget child,
  double borderWidth = 0.2,
  BorderStyle borderStyle = BorderStyle.solid,
  double padding = 0,
  double bottomMargin = 0,
  double leftMargin = 0,
  double rightMargin = 0,
  double rightPadding = 0,
}) =>
    Container(
        margin: EdgeInsets.only(bottom: bottomMargin, right: rightMargin, left: leftMargin),
        padding: EdgeInsets.only(top: padding, bottom: padding, left: padding, right: rightPadding),
        decoration: BoxDecoration(
          border: Border.all(width: borderWidth, style: borderStyle),
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: child);
