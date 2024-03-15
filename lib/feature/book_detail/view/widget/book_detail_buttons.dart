part of '../book_detail_view.dart';

final class _BookDetailButtons extends StatelessWidget {
  const _BookDetailButtons(
    this.book,
  );

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _FavoriteButton(
          book,
        ),
        SizedBox(width: context.dynamicWidth(0.02)),
        _PurchaseButton(
          book,
        ),
      ],
    );
  }
}
