part of '../register_view.dart';

final class _LogInButton extends StatelessWidget with NavigationMixin {
  const _LogInButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => navigateToBack(context),
      child: Text(
        'Log In',
        style: context.textTheme.headlineLarge?.copyWith(
          color: ColorName.colorBlue,
        ),
      ),
    );
  }
}
