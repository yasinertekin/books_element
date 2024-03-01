import 'package:bloc_example/product/model/book/books/books.dart';
import 'package:bloc_example/product/service/books_service.dart';

/// Repository for books
abstract class BooksRepository {
  /// Constructor
  BooksRepository({required this.bookService});

  /// The book service
  final BookService bookService;

  /// Fetch books
  Future<Books> getBooks(String query);
}

/// Implementation of [BooksRepository]
final class BooksRepositoryImpl extends BooksRepository {
  /// Implementation of [BooksRepository]
  BooksRepositoryImpl({required super.bookService});
  @override
  Future<Books> getBooks(String query) async {
    final response = await bookService.getBooks(
      query,
    );
    return response;
  }
  // @override
  // Future<Books> getBooks(String query, int startIndex, int maxResults) async {
  //   final response = await bookService.getBooks(
  //     '$query&startIndex=$startIndex&maxResults=$maxResults',
  //   );
  //   return response;
  // }
}
