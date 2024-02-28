part of '../welcome_view.dart';

final class _WelcomeViewBackgroundImage extends StatelessWidget {
  const _WelcomeViewBackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Assets.images.imgWelcome.image(),
    );
  }
}
