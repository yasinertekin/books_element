import 'package:bloc_example/feature/index.dart';

/// BookCard
final class BookCard extends StatelessWidget {
  /// Constructor
  const BookCard({
    required this.item,
    super.key,
  });

  /// The book
  final Item? item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorName.colorWhiteFence,
      child: ListTile(
        onTap: () {
          context.navigateTo(
            BookDetailRoute(
              book: item ?? const Item(),
            ),
          );
        },
        trailing: _BookCardTrailing(item: item),
        title: _BookCardTitle(item: item),
        subtitle: _BookCardSubTitle(item: item),
        leading: _BookCardImage(item: item),
      ),
    );
  }
}

final class _BookCardTrailing extends StatelessWidget with FavoriteBooks {
  const _BookCardTrailing({
    required this.item,
  });

  final Item? item;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<Item>>(
      selector: (state) => state.favoriteBooks,
      builder: (context, state) {
        return IconButton(
          icon: FavoriteIcon(
            book: item ?? const Item(),
            favoriteBooks: state,
          ),
          onPressed: () {
            addOrRemoveFavoriteBook(
              state,
              item ?? const Item(),
              context,
            );
          },
        );
      },
    );
  }
}

final class _BookCardImage extends StatelessWidget {
  const _BookCardImage({
    required this.item,
  });

  final Item? item;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: item?.id ?? '',
      child: CustomNetworkImage(
        borderRadius: 16,
        width: 0.15,
        imageUrl: item?.volumeInfo?.imageLinks?.thumbnail ?? '',
      ),
    );
  }
}

final class _BookCardSubTitle extends StatelessWidget {
  const _BookCardSubTitle({
    required this.item,
  });

  final Item? item;

  @override
  Widget build(BuildContext context) {
    return Text(
      item?.volumeInfo?.authors?.first ?? '',
      maxLines: 1,
    );
  }
}

final class _BookCardTitle extends StatelessWidget {
  const _BookCardTitle({
    required this.item,
  });

  final Item? item;

  @override
  Widget build(BuildContext context) {
    return Text(
      item?.volumeInfo?.title ?? '',
      maxLines: 2,
    );
  }
}
