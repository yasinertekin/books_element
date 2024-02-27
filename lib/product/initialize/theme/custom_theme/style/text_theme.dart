part of '../custom_theme.dart';

@immutable
final class _TextTheme extends TextTheme {
  const _TextTheme()
      : super(
          labelLarge: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: ColorName.colorWhite,
          ),
          headlineSmall: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorName.colorWhite,
          ),
        );
}
