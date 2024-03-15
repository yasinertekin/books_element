part of '../book_detail_view.dart';

final class _BookDescription extends StatelessWidget {
  const _BookDescription({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            book.volumeInfo?.description ?? 'No Description',
            style: context.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
