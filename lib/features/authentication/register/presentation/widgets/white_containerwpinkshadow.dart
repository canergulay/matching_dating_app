import 'package:flutter/material.dart';
import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/ui/theme/palette.dart';

class WhiteContainerWPinkShadow extends StatelessWidget {
  final Widget child;
  final double extraMarginTop;
  final double padding;
  const WhiteContainerWPinkShadow({Key? key, required this.child, this.extraMarginTop = 0, this.padding = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Palette.MPINK.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 25,
              offset: const Offset(3, 3),
            )
          ],
          color: Colors.white,
        ),
        margin: EdgeInsets.fromLTRB(context.widthUnit * 8, context.heightUnit * 6 + extraMarginTop, context.widthUnit * 8, context.heightUnit * 3),
        child: child);
  }
}
