import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/item/item.dart';

final class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    required this.favoriteBooks,
    required this.book,
    super.key,
  });

  final List<Item> favoriteBooks;
  final Item book;

  @override
  Widget build(BuildContext context) {
    return Icon(
      favoriteBooks.contains(book) ? Icons.favorite : Icons.favorite_border,
      color: Colors.black,
    );
  }
}
