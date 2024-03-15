part of '../book_detail_view.dart';

final class _BookImage extends StatelessWidget {
  const _BookImage({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: book.id ?? '',
      child: CustomNetworkImage(
        imageUrl: book.volumeInfo?.imageLinks?.smallThumbnail ?? '',
        height: 0.4,
        fit: BoxFit.fitHeight,
        width: context.dynamicWidth(0.1),
        icNoImageHeight: 0.35,
      ),
    );
  }
}
