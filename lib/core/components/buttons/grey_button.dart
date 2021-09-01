import 'package:flutter/material.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';

Container greyContainer({
  required Color color,
  double radius = 20,
  required Widget child,
  double padding = 0,
  double rightPadding = 0,
}) =>
    Container(
        padding: EdgeInsets.only(top: padding, bottom: padding, left: padding, right: rightPadding),
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: child);
