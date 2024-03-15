part of '../home_view.dart';

final class _FavoriteBookAuthors extends StatelessWidget {
  const _FavoriteBookAuthors({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      book.volumeInfo?.authors?.first ?? '',
      style: context.textTheme.bodySmall,
    );
  }
}
