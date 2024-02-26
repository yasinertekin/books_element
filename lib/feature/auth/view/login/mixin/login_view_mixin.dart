import 'package:bloc_example/feature/auth/view/login/view/login_view.dart';
import 'package:flutter/widgets.dart';

/// Login View Mixin
mixin LoginViewMixin<StatelessWidget extends LoginView> {
  /// Show Error
  void showErrorMessage(BuildContext context, String message) {}

  /// Navigate to Home
  void navigateToHome(BuildContext context) {}
}
