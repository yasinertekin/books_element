import 'package:bloc_example/feature/search/repository/books_repository.dart';
import 'package:bloc_example/product/model/book/books/books.dart';

/// Books UseCase
mixin BooksUseCase {
  /// Fetch books
  Future<Books> getBooks(String query);
}

/// Implementation of [BooksUseCase]
final class BooksUseCaseImpl implements BooksUseCase {
  /// Implementation of [BooksUseCase]
  BooksUseCaseImpl({required this.booksRepository});

  /// The books repository
  final BooksRepository booksRepository;
  @override
  Future<Books> getBooks(String query) async {
    final response = await booksRepository.getBooks(
      query,
    );
    return response;
  }
}
