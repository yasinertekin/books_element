part of '../register_view.dart';

final class _LogInButton extends StatelessWidget {
  const _LogInButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.router.pop(),
      child: Text(
        LocaleKeys.buttons_login,
        style: context.textTheme.headlineSmall?.copyWith(
          color: ColorName.colorBlue,
        ),
      ).tr(),
    );
  }
}
