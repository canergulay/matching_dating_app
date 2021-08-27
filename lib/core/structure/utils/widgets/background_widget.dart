import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';

Container backGroundContainer({required Widget child}) => Container(
      child: child,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(AssetPaths.BACKGROUND))),
    );
