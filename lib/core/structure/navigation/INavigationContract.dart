abstract class NavigationContract {
  Future<void> navigateToPage({String? path, Object? arguments});
  Future<void> navigateToPageAndReset({String? path, Object? arguments});
}
