import 'package:bloc_example/index.dart';

/// AuthInterFace
@immutable
mixin UsersRepositoryMixin {
  /// signWithEmailAndPassword
  Future<void> signInWithEmailAndPassword(Users users);

  /// signUpWithEmailAndPassword
  Future<void> signUpWithEmailAndPassword(Users users);
}

/// UsersRepository
@immutable
final class UsersRepository with UsersRepositoryMixin {
  /// UsersRepository
  UsersRepository(this._authInterFace);
  final AuthInterFace _authInterFace;

  /// signInWithEmailAndPassword
  @override
  Future<void> signInWithEmailAndPassword(Users users) async {
    await _authInterFace.signWithEmailAndPassword(users);
  }

  /// signUpWithEmailAndPassword
  @override
  Future<void> signUpWithEmailAndPassword(Users users) async {
    await _authInterFace.signUpWithEmailAndPassword(users);
  }
}
