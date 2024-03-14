import 'package:bloc_example/feature/index.dart';

/// AuthInterFace
base mixin UsersRepositoryMixin {
  /// signWithEmailAndPassword
  Future<void> signInWithEmailAndPassword(Users users);

  /// signUpWithEmailAndPassword
  Future<void> signUpWithEmailAndPassword(Users users);

  /// GoogleSignIn
  Future<void> googleSignIn();
}

/// UsersRepository
@immutable
final class UsersRepository implements UsersRepositoryMixin {
  /// UsersRepository
  const UsersRepository(this._authInterFace);
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

  @override
  Future<void> googleSignIn() {
    return _authInterFace.googleSignIn();
  }
}
