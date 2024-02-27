import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
