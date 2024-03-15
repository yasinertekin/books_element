part of '../home_view.dart';

final class _FavoriteBookImage extends StatelessWidget {
  const _FavoriteBookImage({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'favorite_id${book.id}',
      child: CustomNetworkImage(
        imageUrl: book.volumeInfo?.imageLinks?.thumbnail,
        height: 0.3,
        fit: BoxFit.fill,
        icNoImageHeight: 0.3,
      ),
    );
  }
}
