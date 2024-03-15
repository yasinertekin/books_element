import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';

part 'widget/favorite_book_authors.dart';
part 'widget/favorite_book_empty_widget.dart';
part 'widget/favorite_book_image.dart';
part 'widget/favorite_book_title.dart';
part 'widget/favorite_books_header.dart';
part 'widget/favorite_button.dart';
part 'widget/favorite_list.dart';
part 'widget/home_view_app_bar.dart';
part 'widget/recommended_books.dart';

@RoutePage()
final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _HomeViewAppBar(),
      body: _HomeViewBody(),
    );
  }
}

final class _HomeViewBody extends StatelessWidget {
  const _HomeViewBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          _FavoriteList(),
          _RecommendedBooks(),
        ],
      ),
    );
  }
}
