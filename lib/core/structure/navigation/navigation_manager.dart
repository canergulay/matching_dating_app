import 'package:flutter/widgets.dart';
import 'INavigationContract.dart';

class NavigationManager implements NavigationContract {
  static NavigationManager _instace = NavigationManager._init();
  static NavigationManager get instance => _instace;
  NavigationManager._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? arguments}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: arguments);
  }

  @override
  Future<void> navigateToPageAndReset({String? path, Object? arguments}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: arguments);
  }
}
