import 'package:flutter/material.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';

Container buttonContainer(BuildContext context,
        {double padding = 15, required Widget child, double margin = 0, double radius = 7.5, Color color = Palette.TEXTFIELDGREY}) =>
    Container(
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius)),
      child: child,
    );
