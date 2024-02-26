import 'package:bloc_example/feature/auth/view/register/view/register_view.dart';
import 'package:flutter/material.dart';

mixin RegisterViewMixin<StatelessWidget extends RegisterView> {
  void showErrorMessage(BuildContext context, String message) {}

  void navigateToHome(BuildContext context) {}
}
