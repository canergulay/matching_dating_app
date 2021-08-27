import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/structure/utils/widgets/logo.dart';

Container backGroundContainerWithLogo({required Widget child, required BuildContext context}) => Container(
      child: Column(
        children: [matchifyLogo(context), Expanded(child: child)],
      ),
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(AssetPaths.BACKGROUND))),
    );
