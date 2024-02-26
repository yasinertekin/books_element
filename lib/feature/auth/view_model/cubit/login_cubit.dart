import 'package:bloc_example/feature/auth/use_case/login_use_case.dart';
import 'package:bloc_example/feature/auth/view_model/state/login_state.dart';
import 'package:bloc_example/product/model/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
