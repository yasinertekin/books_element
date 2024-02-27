part of '../custom_theme.dart';

@immutable
final class _OutlineInputBorder extends OutlineInputBorder {
  const _OutlineInputBorder()
      : super(
          borderSide: const BorderSide(
            color: ColorName.colorSpanishWhite,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        );
}
