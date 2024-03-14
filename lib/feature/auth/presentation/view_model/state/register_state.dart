/// Register State freezed class
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

/// Register State freezed union
@freezed
abstract class RegisterState with _$RegisterState {
  /// Register State initial
  const factory RegisterState.initial() = _Initial;

  /// Register State loading
  const factory RegisterState.loading() = _Loading;

  /// Register State success
  const factory RegisterState.success() = _Success;

  /// Register State error
  const factory RegisterState.error(String errorMessage) = _Error;
}
