import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/feature/search/view_model/cubit/books_cubit.dart';
import 'package:bloc_example/feature/search/view_model/cubit/state/books_state.dart';
import 'package:bloc_example/product/model/book/books/books.dart';

@RoutePage()
final class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BooksCubit>().getBooks('Flutter');
        },
        child: const Icon(Icons.search),
      ),
      body: BlocBuilder<BooksCubit, BooksState>(
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
    );
  }
}

final class _BookList extends StatelessWidget {
  const _BookList({
    required this.books,
    super.key,
  });

  final Books books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.items!.length,
      itemBuilder: (context, index) {
        final item = books.items![index];
        return ListTile(
          title: Text(item.volumeInfo!.title!),
          subtitle: Text(item.volumeInfo!.authors!.join(', ')),
        );
      },
    );
  }
}

final class _ErrorText extends StatelessWidget {
  const _ErrorText({
    required this.error,
    super.key,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
