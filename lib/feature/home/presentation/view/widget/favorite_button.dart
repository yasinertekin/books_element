part of '../home_view.dart';

final class _FavoriteButton extends StatelessWidget with FavoriteBooks {
  const _FavoriteButton({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<Item>>(
      selector: (state) {
        return state.favoriteBooks;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            addOrRemoveFavoriteBook(state, book, context);
          },
          child: FavoriteIcon(
            favoriteBooks: state,
            book: book,
          ),
        );
      },
    );
  }
}
