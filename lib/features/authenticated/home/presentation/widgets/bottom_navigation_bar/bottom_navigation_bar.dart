import 'package:flutter/material.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/features/authenticated/home/presentation/widgets/bottom_navigation_bar/items.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  static const double _radiusValue = 30;

  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.limitedheightUnit * 10,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(100), offset: const Offset(0, -5), blurRadius: 14, spreadRadius: 1)],
            color: Palette.APP_BLACK,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(_radiusValue), topRight: Radius.circular(_radiusValue))),
        child: const BottomBarItems());
  }
}
