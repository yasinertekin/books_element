part of '../book_detail_view.dart';

final class _BookTitle extends StatelessWidget {
  const _BookTitle({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        book.volumeInfo?.title ?? '',
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
