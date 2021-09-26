import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/grey_button.dart';
import 'package:matchangoo/core/components/widgets/button_container.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';

//takes an widget as a child and turns that into an animated button with animated builder & transform.scale

class AnimatorButtonWithContainer extends StatefulWidget {
  final Widget childToBeAnimated;
  final VoidCallback onPressed;
  final bool isOnPressedBeforeAnimation;
  final double upperBound;
  final Color containerColor;
  final double margin;
  final double padding;
  const AnimatorButtonWithContainer(
      {Key? key,
      this.upperBound = 1,
      required this.childToBeAnimated,
      this.containerColor = Palette.TEXTFIELDGREY,
      required this.onPressed,
      this.margin = 0,
      this.padding = 15,
      this.isOnPressedBeforeAnimation = false})
      : super(key: key);

  @override
  _AnimatorButtonGreyContainerState createState() => _AnimatorButtonGreyContainerState();
}

class _AnimatorButtonGreyContainerState extends State<AnimatorButtonWithContainer> with SingleTickerProviderStateMixin {
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
            child: buttonContainer(
              context,
              color: widget.containerColor,
              margin: widget.margin,
              padding: widget.padding,
              child: Transform.scale(
                scale: 1 - _animationController.value,
                child: widget.childToBeAnimated,
              ),
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
