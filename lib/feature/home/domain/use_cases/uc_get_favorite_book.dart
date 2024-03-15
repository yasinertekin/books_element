import 'package:bloc_example/feature/home/domain/repository/favorite_book_repository.dart';
import 'package:bloc_example/product/model/book/item/item.dart';

base mixin UCGetFavoriteBook {
  Future<List<Item>> call(String userId);
}

final class GetFavoriteBook implements UCGetFavoriteBook {
  const GetFavoriteBook({
    required IFavoriteBookRepository favoriteBookRepository,
  }) : _favoriteBookRepository = favoriteBookRepository;

  final IFavoriteBookRepository _favoriteBookRepository;

  @override
  Future<List<Item>> call(String userId) {
    return _favoriteBookRepository.getBooks(
      userId,
    );
  }
}
