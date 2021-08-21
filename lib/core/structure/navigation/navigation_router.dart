import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/presentation/bloc/identification_bloc.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification.dart';
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
      case NavigationConstants.IDENTIFICATION:
        return normalNavigate(Identification());

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
