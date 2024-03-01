import 'package:bloc_example/feature/index.dart';

/// Extension for space between widgets
extension SpaceBetweenWidgets on Column {
  /// Space between widgets
  Column space(double spaceAmount) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      children: List<Widget>.generate(
        children.length * 2 - 1,
        (index) {
          if (index.isEven) {
            return children[index ~/ 2];
          } else {
            return SizedBox(height: spaceAmount);
          }
        },
      ),
    );
  }
}
