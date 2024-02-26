import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';

@freezed

/// Users Model Class
class Users with _$Users {
  /// Users Factory
  const factory Users({
    required String email,
    required String password,
  }) = _Users;
}
