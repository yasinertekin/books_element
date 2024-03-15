part of '../book_detail_view.dart';

final class _RatingRow extends StatelessWidget {
  const _RatingRow({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.imgStar.image(),
        const CustomSizedBox(
          width: 0.02,
          height: 0,
        ),
        if (book.volumeInfo?.averageRating == null)
          const Text('No Rating')
        else
          Text('${book.volumeInfo?.averageRating}/10'),
      ],
    );
  }
}
