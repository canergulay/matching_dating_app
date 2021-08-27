import 'package:flutter/material.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';

Container whiteContainerWPinkShadow(BuildContext context, Widget child) {
  return Container(
      padding: EdgeInsets.all(context.widthUnit * 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Palette.MPINK.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 25,
            offset: Offset(3, 3),
          )
        ],
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: child);
}
