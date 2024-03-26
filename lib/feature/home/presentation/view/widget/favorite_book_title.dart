part of '../home_view.dart';

final class _FavoriteBookTitle extends StatelessWidget {
  const _FavoriteBookTitle({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        book.volumeInfo?.title ?? '',
        style: context.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
