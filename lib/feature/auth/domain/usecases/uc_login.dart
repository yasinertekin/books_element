import 'package:bloc_example/feature/index.dart';

/// LoginUseCaseMixin
@immutable
base mixin UCLoginMixin {
  /// signInWithEmailAndPassword
  Future<void> signInWithEmailAndPassword(Users users);
}

/// UsersUseCase
@immutable
final class LoginUseCase with UCLoginMixin {
  /// UsersUseCase
  LoginUseCase(this._usersRepository);
  final UsersRepository _usersRepository;

  /// signInWithEmailAndPassword
  @override
  Future<void> signInWithEmailAndPassword(Users users) async {
    await _usersRepository.signInWithEmailAndPassword(users);
  }
}
