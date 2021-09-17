import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastShower {
  static ToastShower _instace = ToastShower._init();
  static ToastShower get instance => _instace;
  ToastShower._init();

  void showMyToast(BuildContext context, Widget toast) {
    showToastWidget(toast,
        context: context,
        animation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.slideFromTop,
        position: StyledToastPosition.top,
        isIgnoring: false,
        reverseCurve: Curves.decelerate,
        duration: Duration(minutes: 151),
        curve: Curves.decelerate,
        alignment: Alignment.topCenter);
  }
}

 /*   // Custom Toast Position
  fToast.showToast(
      child: toast,
      toastDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          top: 16.0,
          left: 16.0,
        );
      });*/