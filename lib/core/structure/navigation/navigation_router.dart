import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/structure/navigation/transitions/fade_route.dart';
import 'package:matchangoo/core/structure/navigation/transitions/scale_route.dart';
import 'package:matchangoo/core/structure/navigation/transitions/size_route.dart';
import 'package:matchangoo/core/structure/navigation/transitions/slide_route.dart';

import 'package:matchangoo/features/Identification/presentation/pages/identification.dart';
import 'package:matchangoo/features/authentication/register/presentation/pages/phone_verification.dart';
import 'package:matchangoo/features/authentication/login/presentation/pages/login_main.dart';

import '../../constants/navigation/navigation_constants.dart';
import '../../../features/home/presentation/pages/home_screen.dart';

class NavigationRouter {
  static NavigationRouter _instace = NavigationRouter._init();
  static NavigationRouter get instance => _instace;
  NavigationRouter._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN:
        return normalNavigate(LoginMain());
      case NavigationConstants.HOMESCREEN:
        if (args.arguments is String) {
          return normalNavigate(HomeScreen(arguements: args.arguments as String));
        } else {
          return normalNavigate(HomeScreen(arguements: 'args.arguments qq'));
        }
      case NavigationConstants.IDENTIFICATION:
        return sizeRoute(Identification(), args);
      case NavigationConstants.PHONEVERIFICATION:
        print('BU DORU!');
        return normalNavigate(PhoneVerification());

      default:
        return normalNavigate(LoginMain());
    }
  }

  CupertinoPageRoute normalNavigate(Widget child) {
    return CupertinoPageRoute(
      builder: (context) => child,
    );
  }

  Route fadeNavigate(Widget widget, RouteSettings args) {
    return FadeRoute(page: widget, settings: args);
  }

  Route scaleRoute(Widget widget, RouteSettings args) {
    return ScaleRotateRoute(page: widget, settings: args);
  }

  Route slideRoute(Widget widget, RouteSettings args) {
    return SlideLeftRoute(page: widget, settings: args);
  }

  Route sizeRoute(Widget widget, RouteSettings args) {
    return SizeRoute(page: widget, settings: args);
  }
}
