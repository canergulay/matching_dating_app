import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/buttons/button_container.dart';

class DislikeButton extends StatelessWidget {
  final VoidCallback goLeft;
  const DislikeButton({Key? key, required this.goLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonContainer(context, color: Colors.black, onPressed: goLeft, iconImage: AssetPaths.shared.dontlike);
  }
}
