import 'package:bloc_example/feature/home/domain/repository/favorite_book_repository.dart';
import 'package:bloc_example/product/model/book/item/item.dart';
import 'package:flutter/foundation.dart';

/// A use case for adding books.
abstract class IUCAddFavoriteBookUseCase {
  IUCAddFavoriteBookUseCase({
    required IFavoriteBookRepository favoriteBookRepository,
  }) : _favoriteBookRepository = favoriteBookRepository;

  /// Adds a book to the database.
  Future<void> addBook(Item book, String userId);

  /// Implementation of [IFavoriteBookRepository]
  final IFavoriteBookRepository _favoriteBookRepository;
}

/// Implementation of [IAddFavoriteBookUseCase]
@immutable
final class IUCAddFavoriteBookUseCaseImpl implements IUCAddFavoriteBookUseCase {
  const IUCAddFavoriteBookUseCaseImpl({
    required IFavoriteBookRepository favoriteBookRepository,
  }) : _favoriteBookRepository = favoriteBookRepository;

  @override
  final IFavoriteBookRepository _favoriteBookRepository;

  @override
  Future<void> addBook(Item book, String userId) {
    return _favoriteBookRepository.addBook(book, userId);
  }
}
