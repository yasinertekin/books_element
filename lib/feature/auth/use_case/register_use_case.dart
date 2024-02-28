import 'package:bloc_example/feature/auth/repository/users_repository.dart';
import 'package:bloc_example/product/model/users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
