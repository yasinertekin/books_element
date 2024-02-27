part of '../custom_theme.dart';

@immutable
final class _ButtonStyle extends ButtonStyle {
  _ButtonStyle()
      : super(
          backgroundColor: MaterialStateProperty.all<Color>(
            ColorName.colorNitens,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
}
