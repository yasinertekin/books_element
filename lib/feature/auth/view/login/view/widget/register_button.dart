part of '../login_view.dart';

final class _RegisterButton extends StatelessWidget with NavigationMixin {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => navigateToNamedRoute(
          context,
          NavigationConstants.registerView,
        ),
        child: const Text(
          "Don't have an account? Register",
        ),
      ),
    );
  }
}
