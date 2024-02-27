import 'package:flutter/material.dart';

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
