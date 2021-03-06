import 'package:flutter/material.dart';
import '../../../../../core/constants/asset_paths.dart';
import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/utils/extensions/sizedbox_extension.dart';
import '../../../../../core/ui/components/headlines.dart';

enum ButtonType { FACEBOOK, GOOGLE }

class AnimatedFacebookGoogleButton extends StatefulWidget {
  final VoidCallback onTap;
  final ButtonType type;
  const AnimatedFacebookGoogleButton({required this.onTap, required this.type, Key? key}) : super(key: key);

  @override
  _AnimatedFacebookGoogleButtonState createState() => _AnimatedFacebookGoogleButtonState();
}

class _AnimatedFacebookGoogleButtonState extends State<AnimatedFacebookGoogleButton> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
      lowerBound: 1,
      upperBound: 5,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _animationController.forward().then((value) => _animationController.reverse());
          widget.onTap();
        },
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, d) {
              return Container(
                width: context.dynamicWidth / 2.5,
                margin: EdgeInsets.only(top: _animationController.value, bottom: _animationController.value),
                padding: EdgeInsets.all(context.heightUnit * 2 - _animationController.value * 2),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 1, color: Colors.black.withOpacity(0.4))]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1 / _animationController.value,
                      child: Image.asset(
                        widget.type == ButtonType.FACEBOOK ? AssetPaths.shared.FACEBOOK : AssetPaths.shared.GOOGLE,
                        scale: 2,
                      ),
                    ),
                    const SizedBox().widthSpacer(context, 3),
                    headLineEight(context, widget.type == ButtonType.FACEBOOK ? "Facebook" : "Google",
                        size: 2 + 2 / _animationController.value, color: Colors.white, fontWeight: FontWeight.w500)
                  ],
                ),
              );
            }));
  }
}
