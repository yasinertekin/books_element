import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/feature/search/cubit/books_cubit.dart';
import 'package:bloc_example/feature/search/cubit/state/books_state.dart';

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.error != null) {
            return Center(
              child: Text('${state.error} haa'),
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
