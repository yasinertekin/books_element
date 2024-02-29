import 'package:bloc_example/index.dart';

@immutable
mixin GoogleSignInUseCaseMixin {
  /// Google Sign In
  Future<void> googleSignIn();
}

@immutable

/// GoogleSignInUseCase
final class GoogleSignInUseCase with GoogleSignInUseCaseMixin {
  /// GoogleSignInUseCase
  GoogleSignInUseCase(this._usersRepository);
  final UsersRepository _usersRepository;

  @override
  Future<void> googleSignIn() async {
    await _usersRepository.googleSignIn();
  }
}
