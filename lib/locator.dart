import 'package:bloc_example/feature/auth/repository/users_repository.dart';
import 'package:bloc_example/feature/auth/use_case/login_use_case.dart';
import 'package:bloc_example/feature/auth/use_case/register_use_case.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/login_cubit.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/register_cubit.dart';
import 'package:bloc_example/product/service/auth_interface.dart';
import 'package:bloc_example/product/widget/text_field/view_model/cubit/custom_text_field_cubit.dart';
import 'package:get_it/get_it.dart';

/// Locator
abstract final class Locator {
  static final _instance = GetIt.instance;

  /// Login Cubit
  static LoginCubit get loginCubit => _instance<LoginCubit>();

  /// Register Cubit
  static RegisterCubit get registerCubit => _instance<RegisterCubit>();

  /// Counter Cubit
  static TextFieldCubit get counterCubit => _instance<TextFieldCubit>();

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
      );
  }
}
