part of '../register_view.dart';

final class _RegisterTitle extends StatelessWidget {
  const _RegisterTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.register_title,
      textAlign: TextAlign.center,
      style: context.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ).tr();
  }
}
