import 'package:bloc_example/feature/home/domain/repository/favorite_book_repository.dart';
import 'package:bloc_example/product/model/book/item/item.dart';
import 'package:flutter/foundation.dart';

/// A use case for adding and deleting books.
abstract class IUCDeleteFavoriteBook {
  IUCDeleteFavoriteBook({
    required IFavoriteBookRepository favoriteBookRepository,
  }) : _favoriteBookRepository = favoriteBookRepository;

  /// Deletes a book from the database.
  Future<void> deleteBook(Item book, String userId);

  final IFavoriteBookRepository _favoriteBookRepository;
}

/// Implementation of [IFavoriteBookUseCase]
@immutable
final class IUCDeleteFavoriteBookImpl implements IUCDeleteFavoriteBook {
  const IUCDeleteFavoriteBookImpl({
    required IFavoriteBookRepository favoriteBookRepository,
  }) : _favoriteBookRepository = favoriteBookRepository;

  @override
  final IFavoriteBookRepository _favoriteBookRepository;

  @override
  Future<void> deleteBook(Item book, String userId) {
    return _favoriteBookRepository.deleteBook(book, userId);
  }
}
