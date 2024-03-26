import 'package:bloc_example/feature/search/domain/books_repository/books_repository.dart';
import 'package:bloc_example/product/model/book/books/books.dart';

/// Books UseCase
base mixin UCSearchBookUseCase {
  /// Fetch books
  Future<Books> getBooks(String query);
}

/// Implementation of [BooksUseCase]
final class UCSearchBookUseCaseImpl implements UCSearchBookUseCase {
  /// Implementation of [BooksUseCase]
  UCSearchBookUseCaseImpl({required this.booksRepository});

  /// The books repository
  final SearchBookRepository booksRepository;
  @override
  Future<Books> getBooks(String query) async {
    final response = await booksRepository.getBooks(
      query,
    );
    return response;
  }
}
