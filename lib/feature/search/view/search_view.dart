import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/feature/search/view_model/cubit/books_cubit.dart';
import 'package:bloc_example/feature/search/view_model/cubit/state/books_state.dart';

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
            return ListView.builder(
              itemCount: state.books!.items!.length,
              itemBuilder: (context, index) {
                final item = state.books!.items![index];
                return ListTile(
                  title: Text(item.volumeInfo!.title!),
                  subtitle: Text(item.volumeInfo!.authors!.join(', ')),
                );
              },
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
