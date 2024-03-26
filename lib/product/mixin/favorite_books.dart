import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/core/extensions/show_error_extension.dart';

/// A mixin that contains the addOrRemoveFavoriteBook method.
base mixin FavoriteBooks {
  /// Adds or removes the book from the favorite list.
  void addOrRemoveFavoriteBook(
    List<Item> favoriteBooks,
    Item book,
    BuildContext context,
  ) {
    FirebaseAuth.instance.currentUser == null
        ? context.showErrorMessage('Lütfen giriş yapınız.')
        : favoriteBooks.contains(book)
            ? context.read<HomeCubit>().removeFavoriteBook(
                  book,
                  FirebaseAuth.instance.currentUser!.uid,
                )
            : context.read<HomeCubit>().addFavoriteBook(
                  book,
                  FirebaseAuth.instance.currentUser!.uid,
                );
  }
}
