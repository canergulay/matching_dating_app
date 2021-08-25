import 'package:flutter/material.dart';
import '../../structure/utils/extensions/context_extension.dart';

import '../../ui/theme/palette.dart';

class AnimatedButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final Color titleColor;
  final Color buttonColor;
  final double buttonRadius;

  const AnimatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.titleColor = Colors.white,
    this.buttonColor = Palette.buttonRed,
    this.buttonRadius = 30,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  static const _animationMultiplier = 2;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      reverseDuration: Duration(milliseconds: 150),
      vsync: this,
      duration: Duration(milliseconds: 75),
      lowerBound: 3,
      upperBound: 6,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: GestureDetector(
        onTap: _onButtonTapController,
        onLongPressStart: _onLongPressStart,
        onLongPressEnd: _onLongPressEnd,
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (
              context,
              d,
            ) {
              return Container(
                margin: EdgeInsets.only(
                    top: 2 + _animationController.value * _animationMultiplier,
                    bottom: 15 + _animationController.value * _animationMultiplier,
                    right: 15 + _animationController.value * _animationMultiplier,
                    left: 15 + _animationController.value * _animationMultiplier),
                decoration: BoxDecoration(color: widget.buttonColor, borderRadius: BorderRadius.circular(widget.buttonRadius)),
                width: double.infinity,
                child: Center(
                    child: Text(widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: widget.titleColor, fontSize: context.heightUnit * 3 - _animationController.value))),
              );
            }),
      ),
    );
  }

  void _onLongPressStart(LongPressStartDetails details) {
    widget.onPressed();
    _animationController.forward();
  }

  void _onLongPressEnd(LongPressEndDetails details) => _animationController.reverse();

  void _onButtonTapController() {
    widget.onPressed();
    switch (_animationController.status) {
      case AnimationStatus.completed:
        _animationController.reverse();
        break;
      case AnimationStatus.dismissed:
        _animationController.forward().then((value) => _animationController.reverse());
        break;
      default:
    }
  }
}
