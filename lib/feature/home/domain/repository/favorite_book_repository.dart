import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/item/item.dart';
import 'package:bloc_example/product/service/firebase/books/firebase_book_service.dart';

/// A repository for books.
abstract class IFavoriteBookRepository {
  IFavoriteBookRepository({
    required IFirebaseBookService firebaseBookService,
  }) : _firebaseBookService = firebaseBookService;

  /// Adds a book to the database.
  Future<void> addBook(Item book, String userId);

  /// Deletes a book from the database.
  Future<void> deleteBook(Item book, String userId);

  /// Implementation of [IFirebaseBookService]
  final IFirebaseBookService _firebaseBookService;

  /// Returns a list of books from the database.
  Future<List<Item>> getBooks(String userId) {
    return _firebaseBookService.getBooks(userId);
  }
}

/// Implementation of [IFavoriteBookRepository]
@immutable
final class FavoriteBookRepositoryImpl implements IFavoriteBookRepository {
  const FavoriteBookRepositoryImpl({
    required IFirebaseBookService firebaseBookService,
  }) : _firebaseBookService = firebaseBookService;

  @override
  final IFirebaseBookService _firebaseBookService;

  @override
  Future<void> addBook(Item book, String userId) {
    return _firebaseBookService.addBook(book, userId);
  }

  @override
  Future<void> deleteBook(Item book, String userId) {
    return _firebaseBookService.deleteBook(book, userId);
  }

  @override
  Future<List<Item>> getBooks(String userId) {
    return _firebaseBookService.getBooks(userId);
  }
}
