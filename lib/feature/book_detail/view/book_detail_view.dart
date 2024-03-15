import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';

part 'widget/book_authors.dart';
part 'widget/book_description.dart';
part 'widget/book_detail_app_bar.dart';
part 'widget/book_detail_buttons.dart';
part 'widget/book_image.dart';
part 'widget/book_title.dart';
part 'widget/favorite_button.dart';
part 'widget/purchase_button.dart';
part 'widget/rating_row.dart';

@RoutePage()

/// Book Detail View
final class BookDetailView extends StatelessWidget {
  /// Book Detail View
  const BookDetailView({
    required this.book,
    super.key,
  });

  /// Book
  final Item book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _BookDetailAppBar(),
      body: _BookDetailBody(book: book),
    );
  }
}

final class _BookDetailBody extends StatelessWidget {
  const _BookDetailBody({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingAllLow,
        child: Column(
          children: [
            _BookImage(book: book),
            _BookTitle(book: book),
            _BookAuthors(book: book),
            _RatingRow(book: book),
            _BookDetailButtons(
              book,
            ),
            _BookDescription(book: book),
          ],
        ).space(0.01),
      ),
    );
  }
}
