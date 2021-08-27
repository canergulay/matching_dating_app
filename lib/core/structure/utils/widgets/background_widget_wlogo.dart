import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/structure/utils/widgets/logo.dart';

class BackGroundContainerWithLogo extends StatelessWidget {
  final Widget child;
  final bool backButton;
  const BackGroundContainerWithLogo({Key? key, required this.child, this.backButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [backButton ? matchifyLogoWithBackButton(context) : matchifyLogo(context), Expanded(child: child)],
      ),
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(AssetPaths.BACKGROUND))),
    );
  }
}
