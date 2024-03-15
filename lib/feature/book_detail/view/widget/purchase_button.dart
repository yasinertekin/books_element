part of '../book_detail_view.dart';

final class _PurchaseButton extends StatelessWidget {
  const _PurchaseButton(
    this.book,
  );

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Purchase | ${book.saleInfo?.retailPrice?.amount ?? 'N/A'}',
          style: context.textTheme.labelMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
