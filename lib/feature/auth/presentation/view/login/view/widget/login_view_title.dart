part of '../login_view.dart';

final class _LoginViewTitle extends StatelessWidget {
  const _LoginViewTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Book Worm',
      style: context.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
