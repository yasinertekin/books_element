import 'package:bloc_example/feature/auth/repository/users_repository.dart';
import 'package:bloc_example/product/model/users.dart';

/// UsersUseCase
final class LoginUseCase {
  /// UsersUseCase
  LoginUseCase(this._usersRepository);
  final UsersRepository _usersRepository;

  /// signInWithEmailAndPassword
  Future<void> signInWithEmailAndPassword(Users users) async {
    await _usersRepository.signInWithEmailAndPassword(users);
  }
}
