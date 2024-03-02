import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/feature/search/view_model/book_use_case/book_use_case.dart';
import 'package:bloc_example/feature/search/view_model/cubit/state/books_state.dart';

final class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this._booksUseCase) : super(const BooksState()) {
    getBooks('Flutter');
  }

  final BooksUseCase _booksUseCase;

  Future<void> getBooks(String query) async {
    emit(state.copyWith(isLoding: true));
    try {
      final books = await _booksUseCase.getBooks(query);
      emit(state.copyWith(books: books));
    } on Exception catch (e) {
      emit(state.copyWith(error: e.toString()));
    } finally {
      emit(state.copyWith(isLoding: false));
    }
  }
}
// GET https://www.googleapis.com/books/v1/volumes?q=subject:police+OR+mystery&langRestrict=en
