import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';

AnimatorButton buttonContainer(BuildContext context, {required Color color, required String iconImage}) {
  return AnimatorButton(
    upperBound: 0.3,
    onPressed: () {},
    childToBeAnimated: Container(
      padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 7, vertical: context.heightUnit * 1.4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radiusAdjuster(iconImage)),
          color: color,
          boxShadow: [BoxShadow(color: color.withOpacity(0.3), offset: const Offset(0, 5), blurRadius: 11, spreadRadius: 2)]),
      child: Transform.scale(
        scale: scaleAdjuster(iconImage),
        child: Image.asset(
          iconImage,
        ),
      ),
    ),
  );
}

double radiusAdjuster(String iconImage) => iconImage == AssetPaths.shared.like ? 15 : 25;
double scaleAdjuster(String iconImage) => iconImage == AssetPaths.shared.like ? 1.4 : 1;
