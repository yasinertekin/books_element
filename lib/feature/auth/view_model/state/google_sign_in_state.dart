import 'package:bloc_example/index.dart';

part 'google_sign_in_state.freezed.dart';

@freezed
abstract class GoogleSignInState with _$GoogleSignInState {
  const factory GoogleSignInState.initial() = _Initial;
  const factory GoogleSignInState.loading() = _Loading;
  const factory GoogleSignInState.success() = _Success;
  const factory GoogleSignInState.error(String errorMessage) = _Error;
}
