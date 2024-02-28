import 'package:bloc_example/index.dart';

/// RegisterUseCaseMixin
@immutable
mixin RegisterUseCaseMixin {
  /// signUpWithEmailAndPassword
  Future<void> signUpWithEmailAndPassword(Users users);
}

/// UsersUseCase
@immutable
final class RegisterUseCase with RegisterUseCaseMixin {
  /// UsersUseCase
  RegisterUseCase(this._usersRepository);
  final UsersRepository _usersRepository;

  /// signUpWithEmailAndPassword
  @override
  Future<void> signUpWithEmailAndPassword(Users users) async {
    await _usersRepository.signUpWithEmailAndPassword(users);
  }
}
