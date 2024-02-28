import 'package:bloc_example/index.dart';

/// Navigation Mixin
mixin NavigationMixin {
  /// Navigate to Back
  void navigateToBack(BuildContext context) {
    context.router.pop();
  }

  /// Navigate to Named Route
  void navigateToNamedRoute(BuildContext context, String route) {
    context.router.pushNamed(route);
  }
}
