import 'package:bloc_example/feature/auth/use_case/google_sign_in_use_case.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/google_sign_in_cubit.dart';
import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/feature/search/book_use_case/book_use_case.dart';
import 'package:bloc_example/feature/search/cubit/books_cubit.dart';
import 'package:bloc_example/feature/search/repository/books_repository.dart';
import 'package:bloc_example/product/service/books_service.dart';
import 'package:bloc_example/product/service/dio_manager.dart';
import 'package:dio/dio.dart';

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

  /// BooksCubit
  static BooksCubit get booksCubit => _instance<BooksCubit>();

  /// Setup
  static Future<void> setup() async {
    // Repository'ler
    _instance
      ..registerFactory<AuthInterFace>(
        AuthImpl.new,
      )
      ..registerFactory<Dio>(
        DioManager.DioService,
      )
      ..registerFactory<AuthImpl>(
        AuthImpl.new,
      )
      ..registerFactory<UsersRepository>(
        () => UsersRepository(
          _instance(),
        ),
      )
      ..registerFactory<BooksRepository>(
        () => BooksRepositoryImpl(bookService: _instance()),
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
      ..registerFactory<BooksUseCase>(
        () => BooksUseCaseImpl(
          booksRepository: _instance(),
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
      )

      /// bOOK Service
      ..registerFactory<BookService>(
        () => BookServiceImpl(
          service: _instance(),
        ),
      )
      ..registerFactory<BooksCubit>(
        () => BooksCubit(
          _instance(),
        ),
      );
  }
}
