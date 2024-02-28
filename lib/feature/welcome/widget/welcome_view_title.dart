part of '../welcome_view.dart';

final class _WelcomeViewTitle extends StatelessWidget {
  const _WelcomeViewTitle();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        textAlign: TextAlign.left,
        LocaleKeys.welcome_title,
        style: context.textTheme.displayMedium?.copyWith(
          color: ColorName.colorBlue,
          fontWeight: FontWeight.bold,
        ),
      ).tr(),
    );
  }
}
