import 'package:flutter/material.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';

Container buttonContainer(BuildContext context,
        {double padding = 15, required Widget child, double radius = 7.5, Color color = Palette.TEXTFIELDGREY}) =>
    Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius)),
      child: child,
    );
