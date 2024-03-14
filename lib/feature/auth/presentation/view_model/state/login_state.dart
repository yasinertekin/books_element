import 'package:bloc_example/feature/index.dart';

part 'login_state.freezed.dart';

@freezed

/// Login State Class
abstract class LoginState with _$LoginState {
  /// Initial State
  const factory LoginState.initial() = _Initial;

  /// Loading State
  const factory LoginState.loading() = _Loading;

  /// Success State
  const factory LoginState.success() = _Success;

  /// Error State
  const factory LoginState.error(String errorMessage) = _Error;
}
