import 'package:bloc_example/product/model/users.dart';
import 'package:bloc_example/product/service/auth_interface.dart';

/// UsersRepository
final class UsersRepository {
  /// UsersRepository
  UsersRepository(this._authInterFace);
  final AuthInterFace _authInterFace;

  /// signInWithEmailAndPassword
  Future<void> signInWithEmailAndPassword(Users users) async {
    await _authInterFace.signWithEmailAndPassword(users);
  }

  /// signUpWithEmailAndPassword
  Future<void> signUpWithEmailAndPassword(Users users) async {
    await _authInterFace.signUpWithEmailAndPassword(users);
  }
}
