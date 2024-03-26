import 'package:bloc_example/feature/index.dart';

/// A widget that displays a box with a specified size.
final class CustomSizedBox extends StatelessWidget {
  /// Creates a widget that displays a box with a specified size.
  const CustomSizedBox({
    super.key,
    this.height,
    this.width,
  });

  /// The height of the box.
  final double? height;

  /// The width of the box.
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(height ?? 0.01),
      width: context.dynamicWidth(width ?? 0.01),
    );
  }
}
