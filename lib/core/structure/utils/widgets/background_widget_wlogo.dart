import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/structure/utils/widgets/logo.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';

class BackGroundContainerWithLogo extends StatelessWidget {
  final Widget child;

  const BackGroundContainerWithLogo({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      child: child,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(AssetPaths.BACKGROUND))),
    );
  }
}
