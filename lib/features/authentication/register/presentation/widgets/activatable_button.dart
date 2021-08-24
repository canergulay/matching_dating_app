import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animated_button.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';

Widget getAnimatedButton(bool typed, BuildContext context, VoidCallback onPressed) {
  return typed ? activeButton(context, onPressed) : passiveButton(context);
}

Container activeButton(BuildContext context, VoidCallback onPressed) => Container(
      margin: EdgeInsets.only(left: context.widthUnit * 20, right: context.widthUnit * 20),
      child: AnimatedButton(
        title: 'send code',
        onPressed: onPressed,
        buttonRadius: 5,
      ),
    );

Container passiveButton(BuildContext context) => Container(
      margin: EdgeInsets.only(left: context.widthUnit * 20, right: context.widthUnit * 20),
      child: AnimatedButton(
        title: 'send code',
        onPressed: () {},
        titleColor: Colors.black,
        buttonColor: Colors.grey.shade300,
        buttonRadius: 0,
      ),
    );
