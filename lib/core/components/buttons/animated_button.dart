import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../structure/utils/extensions/context_extension.dart';
import '../../ui/theme/palette.dart';

class AnimatedButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final Color titleColor;
  final Color buttonColor;
  final Color shadowColor;
  final double shadowOpacity;
  final double buttonRadius;
  final Widget? child;

  const AnimatedButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.shadowOpacity = 0.3,
      this.shadowColor = Colors.pink,
      this.titleColor = Colors.white,
      this.buttonColor = Palette.buttonRed,
      this.buttonRadius = 30,
      this.child})
      : super(key: key);

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
      reverseDuration: const Duration(milliseconds: 100),
      vsync: this,
      duration: const Duration(milliseconds: 100),
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
      height: 70,
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
                    bottom: 2 + _animationController.value * _animationMultiplier,
                    right: 2 + _animationController.value * _animationMultiplier,
                    left: 2 + _animationController.value * _animationMultiplier),
                decoration: BoxDecoration(color: widget.buttonColor, borderRadius: BorderRadius.circular(widget.buttonRadius), boxShadow: [
                  BoxShadow(
                    color: widget.shadowColor.withOpacity(widget.shadowOpacity),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(3, 3),
                  ),
                  BoxShadow(
                    color: Palette.MPINK.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(-1, 0),
                  )
                ]),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: AutoSizeText(widget.title,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline5?.copyWith(color: widget.titleColor, fontSize: 23 - _animationController.value)),
                ),
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

  void _onButtonTapController() async {
    switch (_animationController.status) {
      case AnimationStatus.completed:
        await _animationController.reverse();
        break;
      case AnimationStatus.dismissed:
        await _animationController.forward().then((value) => _animationController.reverse());
        break;
      default:
    }
    widget.onPressed();
  }
}
