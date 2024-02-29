import 'package:bloc_example/index.dart';
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
      // Hata oluştuğunda yapılacak işlemler
      print('Hata: $e');
      rethrow; // Hatanın yukarıya fırlatılması (yalnızca gerekirse)
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
      // Hata oluştuğunda yapılacak işlemler
      print('Hata: $e');
      rethrow; // Hatanın yukarıya fırlatılması (yalnızca gerekirse)
    }
  }

  @override
  Future<GoogleSignInAccount> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw 'Google Sign In işlemi iptal edildi';
      }
      return googleUser;
    } catch (e) {
      // Hata oluştuğunda yapılacak işlemler
      print('Hata: $e');
      rethrow;
    }
  }
}
