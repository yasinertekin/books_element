import 'package:bloc_example/feature/auth/use_case/google_sign_in_use_case.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/google_sign_in_cubit.dart';
import 'package:bloc_example/index.dart';

/// Locator
abstract final class Locator {
  static final _instance = GetIt.instance;

  /// Login Cubit
  static LoginCubit get loginCubit => _instance<LoginCubit>();

  /// Register Cubit
  static RegisterCubit get registerCubit => _instance<RegisterCubit>();

  /// TextField Cubit
  static TextFieldCubit get textFieldCubit => _instance<TextFieldCubit>();

  /// GoogleSignInCubit
  static GoogleSignInCubit get googleSignInCubit =>
      _instance<GoogleSignInCubit>();

  /// Setup
  static Future<void> setup() async {
    // Repository'ler
    _instance
      ..registerFactory<AuthInterFace>(
        AuthImpl.new,
      )
      ..registerFactory<AuthImpl>(
        AuthImpl.new,
      )
      ..registerFactory<UsersRepository>(
        () => UsersRepository(
          _instance(),
        ),
      )

      // Use Case'ler
      ..registerFactory<LoginUseCase>(
        () => LoginUseCase(
          _instance(),
        ),
      )
      ..registerSingleton<RegisterUseCase>(
        RegisterUseCase(
          _instance(),
        ),
      )
      ..registerFactory<GoogleSignInUseCase>(
        () => GoogleSignInUseCase(
          _instance(),
        ),
      )

      // Cubit'ler
      ..registerFactory<LoginCubit>(
        () => LoginCubit(
          _instance(),
        ),
      )
      ..registerFactory<TextFieldCubit>(
        TextFieldCubit.new,
      )
      ..registerFactory<RegisterCubit>(
        () => RegisterCubit(
          _instance(),
        ),
      )
      ..registerFactory<GoogleSignInCubit>(
        () => GoogleSignInCubit(
          _instance(),
        ),
      );
  }
}
