import 'package:bloc_example/feature/index.dart';

@immutable
base mixin UCGoogleSignInMixin {
  /// Google Sign In
  Future<void> googleSignIn();
}

@immutable

/// GoogleSignInUseCase
final class GoogleSignInUseCase with UCGoogleSignInMixin {
  /// GoogleSignInUseCase
  GoogleSignInUseCase(this._usersRepository);
  final UsersRepository _usersRepository;

  @override
  Future<void> googleSignIn() async {
    await _usersRepository.googleSignIn();
  }
}
