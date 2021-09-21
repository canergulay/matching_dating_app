import 'package:flutter/material.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  static const double _radiusValue = 30;

  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Palette.APP_BLACK, borderRadius: BorderRadius.only(topLeft: Radius.circular(_radiusValue), topRight: Radius.circular(_radiusValue))),
      height: context.limitedheightUnit * 10,
    );
  }
}
