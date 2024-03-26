part of '../home_view.dart';

final class _FavoriteList extends StatelessWidget {
  const _FavoriteList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FavoriteBooksHeader(),
          const CustomSizedBox(height: 0.02),
          BlocSelector<HomeCubit, HomeState, List<Item>>(
            selector: (state) => state.favoriteBooks,
            builder: (context, state) => SizedBox(
              height: context.dynamicHeight(0.45),
              child: state.isNotEmpty
                  ? const _FavoriteBookList()
                  : const _FavoriteBookEmptyWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

final class _FavoriteBookList extends StatelessWidget {
  const _FavoriteBookList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<Item>>(
      selector: (state) => state.favoriteBooks,
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.length,
          itemBuilder: (context, index) {
            return _FavoriteCard(
              book: state[index],
            );
          },
        );
      },
    );
  }
}

final class _FavoriteCard extends StatelessWidget {
  const _FavoriteCard({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.52),
      child: Card(
        color: ColorName.colorWhiteFence,
        child: InkWell(
          onTap: () {
            context.navigateTo(
              BookDetailRoute(book: book),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _FavoriteBookImage(book: book),
              _FavoriteBookBottom(book: book),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

final class _FavoriteBookBottom extends StatelessWidget {
  const _FavoriteBookBottom({
    required this.book,
  });

  final Item book;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: context.paddingAllLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FavoriteBookTitle(book: book),
            _FavoriteBookAuthors(book: book),
            _FavoriteButton(book: book),
          ],
        ),
      ),
    );
  }
}
