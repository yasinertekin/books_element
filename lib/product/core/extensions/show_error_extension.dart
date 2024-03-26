import 'package:bloc_example/feature/index.dart';

/// Show Error Message Extension
extension ShowErrorMessageExtension on BuildContext {
  /// Show Error Message
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
