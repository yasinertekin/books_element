import 'package:bloc_example/index.dart';

/// LoginCubit
final class LoginCubit extends Cubit<LoginState> {
  /// LoginCubit constructor
  LoginCubit(this._loginUseCase) : super(const LoginState.initial());
  final LoginUseCase _loginUseCase;

  /// signInWithEmailAndPassword
  Future<void> signInWithEmailAndPassword(Users users) async {
    emit(const LoginState.loading());
    try {
      await _loginUseCase.signInWithEmailAndPassword(users);
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
