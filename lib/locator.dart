import 'package:bloc_example/feature/auth/domain/usecases/uc_google_sign_in.dart';
import 'package:bloc_example/feature/auth/presentation/view_model/cubit/google_sign_in_cubit.dart';
import 'package:bloc_example/feature/home/domain/repository/favorite_book_repository.dart';
import 'package:bloc_example/feature/home/domain/use_cases/uc_add_favorite_book.dart';
import 'package:bloc_example/feature/home/domain/use_cases/uc_delete_favorite_book.dart';
import 'package:bloc_example/feature/home/domain/use_cases/uc_get_favorite_book.dart';
import 'package:bloc_example/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/feature/search/domain/book_use_case/uc_search_book.dart';
import 'package:bloc_example/feature/search/domain/books_repository/books_repository.dart';
import 'package:bloc_example/feature/search/presentation/view_model/cubit/search_books_cubit.dart';
import 'package:bloc_example/product/core/dio_manager.dart';
import 'package:bloc_example/product/service/firebase/books/firebase_book_service.dart';

/// Locator
abstract final class Locator {
  static final _instance = GetIt.instance;

  static HomeCubit get homeCubit => _instance<HomeCubit>();

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
  static SearchBooksCubit get booksCubit => _instance<SearchBooksCubit>();

  /// App Router
  static AppRouter get appRouter => _instance<AppRouter>();

  /// Setup
  static Future<void> setup() async {
    // Repository'ler
    _instance
      ..registerFactory<AuthInterFace>(
        AuthImpl.new,
      )
      ..registerFactory<Dio>(
        () => DioManager().dio,
      )
      ..registerFactory<AuthImpl>(
        AuthImpl.new,
      )
      ..registerFactory<UsersRepository>(
        () => UsersRepository(_instance()),
      )
      ..registerFactory<SearchBookRepository>(
        () => SearchBookRepositoryImpl(bookService: _instance()),
      )
      ..registerFactory<IFavoriteBookRepository>(
        () => FavoriteBookRepositoryImpl(
          firebaseBookService: _instance(),
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
      ..registerFactory<UCSearchBookUseCase>(
        () => UCSearchBookUseCaseImpl(
          booksRepository: _instance(),
        ),
      )
      ..registerFactory<IUCAddFavoriteBookUseCase>(
        () => IUCAddFavoriteBookUseCaseImpl(
          favoriteBookRepository: _instance(),
        ),
      )
      ..registerFactory<IUCDeleteFavoriteBook>(
        () => IUCDeleteFavoriteBookImpl(
          favoriteBookRepository: _instance(),
        ),
      )
      ..registerFactory<UCGetFavoriteBook>(
        () => GetFavoriteBook(
          favoriteBookRepository: _instance(),
        ),
      )

      // Cubit'ler

      ..registerFactory<HomeCubit>(
        () => HomeCubit(
          _instance(),
          _instance(),
          _instance(),
        ),
      )
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

      /// Book Service
      ..registerFactory<BookService>(
        () => BookServiceImpl(
          service: _instance(),
        ),
      )
      ..registerFactory<SearchBooksCubit>(
        () => SearchBooksCubit(
          _instance(),
        ),
      )
      ..registerFactory<IFirebaseBookService>(
        FirebaseBookService.new,
      )
      ..registerFactory<AppRouter>(AppRouter.new);
  }
}
