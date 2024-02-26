import 'package:bloc_example/feature/auth/repository/users_repository.dart';
import 'package:bloc_example/product/model/users.dart';

/// UsersUseCase
final class RegisterUseCase {
  /// UsersUseCase
  RegisterUseCase(this._usersRepository);
  final UsersRepository _usersRepository;

  /// signUpWithEmailAndPassword
  Future<void> signUpWithEmailAndPassword(Users users) async {
    await _usersRepository.signUpWithEmailAndPassword(users);
  }
}
