import 'package:bloc_example/index.dart';

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
}

/// AuthImpl
final class AuthImpl implements AuthInterFace {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
}
