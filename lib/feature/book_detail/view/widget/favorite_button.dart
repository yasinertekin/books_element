part of '../book_detail_view.dart';

final class _FavoriteButton extends StatelessWidget with FavoriteBooks {
  const _FavoriteButton(
    this.book,
  );

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return OutlinedButton(
            onPressed: () {
              addOrRemoveFavoriteBook(
                state.favoriteBooks,
                book,
                context,
              );
            },
            child: FittedBox(
              child: Text(
                state.favoriteBooks.contains(book)
                    ? 'Remove from Favorites'
                    : 'Add to Favorites',
                style: context.textTheme.labelSmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
