import 'package:flutter/material.dart';
import '../../../constants/asset_paths.dart';

import '../extensions/context_extension.dart';

class BackGroundContainerWithOutLogo extends StatelessWidget {
  final Widget child;

  const BackGroundContainerWithOutLogo({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(AssetPaths.shared.BACKGROUND))),
      child: child,
    );
  }
}
