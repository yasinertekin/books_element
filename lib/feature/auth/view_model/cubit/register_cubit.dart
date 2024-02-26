import 'package:bloc_example/feature/auth/use_case/register_use_case.dart';
import 'package:bloc_example/feature/auth/view_model/state/register_state.dart';
import 'package:bloc_example/product/model/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Register Cubit
final class RegisterCubit extends Cubit<RegisterState> {
  /// Register Cubit constructor
  RegisterCubit(this._authRepository) : super(const RegisterState.initial());

  final RegisterUseCase _authRepository;

  /// Register user
  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(const RegisterState.loading());
    try {
      await _authRepository.signUpWithEmailAndPassword(
        Users(email: email, password: password),
      );
      emit(const RegisterState.success());
    } on Exception catch (e) {
      emit(RegisterState.error(e.toString()));
    }
  }
}
