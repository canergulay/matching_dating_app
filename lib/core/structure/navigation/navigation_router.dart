import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../../features/home/presentation/pages/home_screen.dart';
import '../../../features/login/presentation/pages/login_main.dart';

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

      default:
        return normalNavigate(LoginMain());
    }
  }

  CupertinoPageRoute normalNavigate(Widget child) {
    return CupertinoPageRoute(
      builder: (context) => child,
    );
  }
}
