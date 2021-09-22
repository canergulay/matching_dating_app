import 'package:flutter/material.dart';

//takes an widget as a child and turns that into an animated button with animated builder & transform.scale

class AnimatorButton extends StatefulWidget {
  final Widget childToBeAnimated;
  final VoidCallback onPressed;
  final bool isOnPressedBeforeAnimation;
  final double upperBound;
  const AnimatorButton(
      {Key? key, this.upperBound = 1, required this.childToBeAnimated, required this.onPressed, this.isOnPressedBeforeAnimation = false})
      : super(key: key);

  @override
  _AnimatorButtonState createState() => _AnimatorButtonState();
}

class _AnimatorButtonState extends State<AnimatorButton> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, upperBound: widget.upperBound, duration: const Duration(milliseconds: 100), reverseDuration: const Duration(milliseconds: 100));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, animation) {
          return GestureDetector(
            onTap: () async {
              if (widget.isOnPressedBeforeAnimation) {
                widget.onPressed();
                await _animationController.forward().then((value) => _animationController.reverse());
              } else {
                await _animationController.forward().then((value) => _animationController.reverse());
                widget.onPressed();
              }
            },
            child: Transform.scale(
              scale: 1 - _animationController.value,
              child: widget.childToBeAnimated,
            ),
          );
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
