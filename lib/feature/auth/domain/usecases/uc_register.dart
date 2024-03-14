import 'package:bloc_example/feature/index.dart';

/// RegisterUseCaseMixin
@immutable
base mixin UCRegisterMixin {
  /// signUpWithEmailAndPassword
  Future<void> signUpWithEmailAndPassword(Users users);
}

/// UsersUseCase
@immutable
final class RegisterUseCase with UCRegisterMixin {
  /// UsersUseCase
  RegisterUseCase(this._usersRepository);
  final UsersRepository _usersRepository;

  /// signUpWithEmailAndPassword
  @override
  Future<void> signUpWithEmailAndPassword(Users users) async {
    await _usersRepository.signUpWithEmailAndPassword(users);
  }
}
