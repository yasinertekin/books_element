part of '../book_detail_view.dart';

final class _BookAuthors extends StatelessWidget {
  const _BookAuthors({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Text(
      book.volumeInfo?.authors?.join(', ') ?? '',
      style: context.textTheme.titleSmall,
    );
  }
}
