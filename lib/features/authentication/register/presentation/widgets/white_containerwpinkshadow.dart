import 'package:flutter/material.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';

class WhiteContainerWPinkShadow extends StatelessWidget {
  final Widget child;
  const WhiteContainerWPinkShadow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: context.widthUnit * 8),
        child: child);
  }
}
