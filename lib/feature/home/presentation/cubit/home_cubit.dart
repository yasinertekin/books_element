import 'package:bloc_example/feature/home/domain/use_cases/uc_add_favorite_book.dart';
import 'package:bloc_example/feature/home/domain/use_cases/uc_delete_favorite_book.dart';
import 'package:bloc_example/feature/home/domain/use_cases/uc_get_favorite_book.dart';
import 'package:bloc_example/feature/index.dart';

/// Cubit for HomeScreen
final class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._addFavoriteBookUseCase,
    this._getFavoriteBookUseCase,
    this._removeFavoriteBookUseCase,
  ) : super(const HomeState()) {
    fetchFavoriteBooks(FirebaseAuth.instance.currentUser?.uid);
  }
  final IUCAddFavoriteBookUseCase _addFavoriteBookUseCase;
  final UCGetFavoriteBook _getFavoriteBookUseCase;
  final IUCDeleteFavoriteBook _removeFavoriteBookUseCase;

  Future<void> addFavoriteBook(Item book, String userId) async {
    try {
      // Call the use case to add the book
      await _addFavoriteBookUseCase.addBook(book, userId);
      // Notify state changes if necessary
      fetchFavoriteBooks(userId);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchFavoriteBooks(String? userId) async {
    if (userId == null) {
      return;
    }
    emit(state.copyWith(isLoading: true)); // Notify UI that loading has started
    try {
      final favoriteBooks = await _getFavoriteBookUseCase(userId ?? '');
      emit(
        state.copyWith(
          favoriteBooks: favoriteBooks,
        ),
      ); // Update UI with fetched data
    } catch (e) {
      emit(state.copyWith(error: e)); // Notify UI about the error
    } finally {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      ); // Notify UI that loading has finished
    }
  }

  Future<void> removeFavoriteBook(Item book, String userId) async {
    try {
      // Call the use case to remove the book
      await _removeFavoriteBookUseCase.deleteBook(book, userId);
      // Notify state changes if necessary
      fetchFavoriteBooks(userId);
    } catch (e) {
      print(e);
    }
  }
}
