import 'package:flutter/material.dart';
import '../../../../../core/ui/theme/palette.dart';
import '../../../../../core/components/buttons/animated_button.dart';
import '../../../../../core/structure/utils/extensions/context_extension.dart';

Widget getAnimatedButton(bool typed, BuildContext context, VoidCallback onPressed) {
  return typed ? activeButton(context, onPressed) : passiveButton(context);
}

Container activeButton(BuildContext context, VoidCallback onPressed) => Container(
      margin: EdgeInsets.only(left: context.widthUnit * 20, right: context.widthUnit * 20),
      child: AnimatedButton(
        title: 'Sign In',
        onPressed: onPressed,
        titleColor: Colors.white,
        buttonColor: Palette.BUTTONACTIVE,
        buttonRadius: 20,
      ),
    );

Container passiveButton(BuildContext context) => Container(
      margin: EdgeInsets.only(left: context.widthUnit * 20, right: context.widthUnit * 20),
      child: AnimatedButton(
        title: 'Sign In',
        onPressed: () {},
        titleColor: Colors.white,
        buttonColor: Palette.BUTTONINACTIVE,
        buttonRadius: 20,
      ),
    );
