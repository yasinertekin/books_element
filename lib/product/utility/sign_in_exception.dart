import 'package:bloc_example/feature/index.dart';

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
