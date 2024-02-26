import 'package:bloc_example/feature/auth/repository/users_repository.dart';
import 'package:bloc_example/feature/auth/use_case/login_use_case.dart';
import 'package:bloc_example/feature/auth/use_case/register_use_case.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/login_cubit.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/register_cubit.dart';
import 'package:bloc_example/product/service/auth_interface.dart';
import 'package:get_it/get_it.dart';

/// Locator
abstract final class Locator {
  static final _instance = GetIt.instance;

  /// Login Cubit
  static LoginCubit get loginCubit => _instance<LoginCubit>();

  /// Register Cubit
  static RegisterCubit get registerCubit => _instance<RegisterCubit>();

  /// Setup
  static Future<void> setup() async {
    _instance
      ..registerFactory<LoginCubit>(
        () => LoginCubit(
          _instance(),
        ),
      )
      ..registerFactory<LoginUseCase>(
        () => LoginUseCase(
          _instance(),
        ),
      )
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

      /// Registering the instance of the AuthImpl
      ..registerSingleton<RegisterUseCase>(
        RegisterUseCase(
          _instance(),
        ),
      )
      ..registerFactory<RegisterCubit>(() => RegisterCubit(_instance()));
  }
}
