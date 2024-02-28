import 'package:bloc_example/gen/assets.gen.dart';
import 'package:bloc_example/product/initialize/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
