import 'package:bloc_example/index.dart';

@immutable

/// CustomException
final class CustomException implements Exception {
  /// CustomException
  const CustomException(this.message);

  /// message
  final String message;

  @override
  String toString() {
    return message;
  }
}
