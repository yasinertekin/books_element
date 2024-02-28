part of '../register_view.dart';

final class _LogInButton extends StatelessWidget with NavigationMixin {
  const _LogInButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => navigateToBack(context),
      child: Text(
        LocaleKeys.buttons_login,
        style: context.textTheme.headlineSmall?.copyWith(
          color: ColorName.colorBlue,
        ),
      ).tr(),
    );
  }
}
