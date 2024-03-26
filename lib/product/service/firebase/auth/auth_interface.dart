import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/core/utility/sign_in_exception.dart';

/// AuthInterFace
abstract class AuthInterFace {
  /// signWithEmailAndPassword
  Future<UserCredential> signWithEmailAndPassword(
    Users users,
  );

  /// signUpWithEmailAndPassword
  Future<UserCredential> signUpWithEmailAndPassword(
    Users users,
  );

  /// GoogleSignIn
  Future<UserCredential> googleSignIn();
}

/// AuthImpl
final class AuthImpl implements AuthInterFace {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _googleAuthProvider = GoogleAuthProvider();

  @override
  Future<UserCredential> signWithEmailAndPassword(Users users) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: users.email,
        password: users.password,
      );
      return userCredential;
    } catch (e) {
      throw const CustomException(
        'E-posta adresi veya şifre hatalı. Lütfen tekrar deneyin.',
      );
    }
  }

  @override
  Future<UserCredential> signUpWithEmailAndPassword(Users users) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: users.email,
        password: users.password,
      );
      return userCredential;
    } catch (e) {
      throw const CustomException(
        'E-posta adresi zaten kullanımda. Lütfen başka bir e-posta adresi deneyin.',
      );
    }
  }

  @override
  Future<UserCredential> googleSignIn() async {
    final googleUser = _firebaseAuth.signInWithProvider(_googleAuthProvider);
    return googleUser;
  }
}
