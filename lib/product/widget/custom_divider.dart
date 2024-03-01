import 'package:bloc_example/feature/index.dart';

/// Custom Divider
final class CustomDivider extends StatelessWidget {
  /// Custom Divider
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Assets.images.imgHorizantalDivider.image(),
        const Text(LocaleKeys.divider_or).tr(),
        Assets.images.imgHorizantalDivider.image(),
      ],
    );
  }
}
