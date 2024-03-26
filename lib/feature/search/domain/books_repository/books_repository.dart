import 'package:bloc_example/product/model/book/books/books.dart';
import 'package:bloc_example/product/service/book_service/books_service.dart';

/// Repository for books
abstract class SearchBookRepository {
  /// Constructor
  SearchBookRepository({required this.bookService});

  /// The book service
  final BookService bookService;

  /// Fetch books
  Future<Books> getBooks(String query);
}

/// Implementation of [SearchBookRepositoryImpl]
final class SearchBookRepositoryImpl extends SearchBookRepository {
  /// Implementation of [SearchBookRepositoryImpl]
  SearchBookRepositoryImpl({required super.bookService});
  @override
  Future<Books> getBooks(String query) async {
    final response = await bookService.getBooks(
      query,
    );
    return response;
  }
}
