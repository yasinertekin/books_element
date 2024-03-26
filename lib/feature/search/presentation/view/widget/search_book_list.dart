part of '../search_view.dart';

final class _SearchBookList extends StatelessWidget {
  const _SearchBookList({
    required this.books,
  });

  final Books books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: ListView.builder(
        itemCount: books.items?.length,
        itemBuilder: (BuildContext context, int index) {
          final item = books.items?[index];
          return BookCard(item: item);
        },
      ),
    );
  }
}
