import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/feature/search/view_model/cubit/books_cubit.dart';
import 'package:bloc_example/feature/search/view_model/cubit/state/books_state.dart';
import 'package:bloc_example/product/model/book/books/books.dart';
import 'package:bloc_example/product/widget/custom_network_image.dart';

@RoutePage()
final class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.dynamicWidth(0.45),
              height: context.dynamicHeight(0.5),
              child: Stack(
                children: [
                  Positioned(
                    bottom: context.height / 11,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: context.dynamicWidth(0.45),
                      height: context.dynamicHeight(0.2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2E9D3),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: context.height / 8.5,
                    left: 0,
                    right: 0,
                    child: const CustomNetworkImage(
                      height: 0.3,
                      fit: BoxFit.contain,
                      imageUrl:
                          'https://assets.api.uizard.io/api/cdn/stream/6dbd88cc-4f52-4da3-baae-b339dfd7e52c.png',
                    ),
                  ),
                ],
              ),
            ),
            CustomTextField(
              onFieldSubmitted: (value) {
                context.read<BooksCubit>().getBooks(value);
              },
              textInputAction: TextInputAction.search,
              controller: controller,
              labelText: 'Search',
            ),
            const _BookListBlocBuilder(),
          ],
        ),
      ),
    );
  }
}

final class _BookListBlocBuilder extends StatelessWidget {
  const _BookListBlocBuilder({
    this.height = 0.5,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.dynamicHeight(height),
        child: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            if (state.isLoding) {
              return const CustomLoading();
            } else if (state.error != null) {
              return _ErrorText(
                error: state.error!,
              );
            } else if (state.books != null) {
              return _BookList(
                books: state.books!,
              );
            } else {
              return const Center(
                child: Text('Enter a search term to begin'),
              );
            }
          },
        ),
      ),
    );
  }
}

final class _BookList extends StatelessWidget {
  const _BookList({
    required this.books,
  });

  final Books books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: books.items?.length,
      itemBuilder: (context, index) {
        final item = books.items?[index];
        return Stack(
          children: [
            Center(
              child: CustomNetworkImage(
                imageUrl: item?.volumeInfo?.imageLinks?.thumbnail,
              ),
            ),
          ],
        );
      },
    );
  }
}

final class _ErrorText extends StatelessWidget {
  const _ErrorText({
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    this.imageUrl =
        'https://assets.api.uizard.io/api/cdn/stream/6dbd88cc-4f52-4da3-baae-b339dfd7e52c.png',
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: context.dynamicWidth(0.4),
      height: context.dynamicHeight(0.25),
    );
  }
}
