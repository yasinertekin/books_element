import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/feature/search/domain/book_use_case/uc_search_book.dart';
import 'package:bloc_example/feature/search/presentation/view_model/state/books_state.dart';

final class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this._booksUseCase) : super(const SearchBooksState()) {
    getBooks('subject:police+OR+mystery');
  }

  final UCSearchBookUseCase _booksUseCase;

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
