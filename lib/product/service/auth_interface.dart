import 'package:bloc_example/index.dart';
import 'package:bloc_example/product/utility/sign_in_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  Future<GoogleSignInAccount> googleSignIn();
}

/// AuthImpl
final class AuthImpl implements AuthInterFace {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
  Future<GoogleSignInAccount> googleSignIn() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw const CustomException(
        'Google hesabı ile giriş yaparken hata oluştu',
      );
    }
    return googleUser;
  }
}
