import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animated_button.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/buttons/button_container.dart';

class LikeButton extends StatelessWidget {
  final VoidCallback goRight;
  static const double aLittleBitBiggerThanTheOthers = 1.4;
  const LikeButton({Key? key, required this.goRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: aLittleBitBiggerThanTheOthers,
        child: buttonContainer(context, onPressed: goRight, iconImage: AssetPaths.shared.like, color: Palette.MPINK));
  }
}
