import 'package:bloc_example/feature/index.dart';

/// GoogleSignInCubit
final class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  /// GoogleSignInCubit
  GoogleSignInCubit(this._googleSignInUseCase)
      : super(const GoogleSignInState.initial());

  final GoogleSignInUseCase _googleSignInUseCase;

  /// googleSignIn
  Future<void> googleSignIn(BuildContext context) async {
    emit(const GoogleSignInState.loading());
    try {
      await _googleSignInUseCase.googleSignIn();
      emit(const GoogleSignInState.success());
    } catch (e) {
      emit(GoogleSignInState.error('Hata: $e'));
    }
  }
}
