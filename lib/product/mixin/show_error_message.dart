import 'package:bloc_example/feature/index.dart';

/// Show Error Message Mixin
mixin ShowErrorMessageMixin {
  /// Show Error Message
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
