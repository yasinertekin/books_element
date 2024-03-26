import 'package:bloc_example/feature/index.dart';

/// Navigation Extension
extension NavigationExtension on BuildContext {
  /// Navigate to Back
  void navigateToBack() {
    Locator.appRouter.pop();
  }

  /// Navigate to Named Route
  void navigateToNamedRoute(String route) {
    Locator.appRouter.navigateNamed(
      route,
    );
  }

  /// Push
  void navigateToPush(PageRouteInfo route) {
    Locator.appRouter.push(
      route,
    );
  }
}
