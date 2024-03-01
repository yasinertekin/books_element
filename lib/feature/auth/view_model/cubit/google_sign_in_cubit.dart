import 'package:bloc_example/feature/auth/use_case/google_sign_in_use_case.dart';
import 'package:bloc_example/feature/auth/view_model/state/google_sign_in_state.dart';
import 'package:bloc_example/feature/index.dart';

/// GoogleSignInCubit
final class GoogleSignInCubit extends Cubit<GoogleSignInState>
    with ShowErrorMessageMixin {
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
