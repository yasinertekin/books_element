import 'package:bloc_example/feature/index.dart';

part 'widget/search_book_list.dart';
part 'widget/search_view_app_bar.dart';

@RoutePage()

/// The search view
final class SearchView extends StatelessWidget {
  /// Constructor
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: const _SearchViewAppBar(),
      body: _SearchViewBody(controller: controller),
    );
  }
}

final class _SearchViewBody extends StatelessWidget {
  const _SearchViewBody({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomSizedBox(
            height: 0.03,
          ),
          CustomTextField(
            textInputAction: TextInputAction.search,
            inputDecoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Search',
            ),
            controller: controller,
            labelText: 'Search',
            onFieldSubmitted: (value) {
              context.read<SearchBooksCubit>().getBooks(value);
            },
          ),
          const _SearchBookBlocBuilder(),
        ],
      ),
    );
  }
}

final class _SearchBookBlocBuilder extends StatelessWidget {
  const _SearchBookBlocBuilder();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchBooksCubit, SearchBooksState>(
        builder: (context, state) {
          if (state.isLoding) {
            return const CustomLoading();
          } else if (state.error != null) {
            return ErrorText(
              error: state.error!,
            );
          } else if (state.books != null) {
            return _SearchBookList(
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
