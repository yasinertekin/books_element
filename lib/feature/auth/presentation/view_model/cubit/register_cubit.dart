import 'package:bloc_example/feature/index.dart';

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
