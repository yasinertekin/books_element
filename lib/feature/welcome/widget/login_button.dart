part of '../welcome_view.dart';

final class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.navigateToNamedRoute(NavigationEnum.loginView.value);
      },
      child: Text(
        LocaleKeys.buttons_login,
        style: context.textTheme.headlineMedium?.copyWith(
          color: ColorName.colorBlue,
          fontWeight: FontWeight.bold,
        ),
      ).tr(),
    );
  }
}
