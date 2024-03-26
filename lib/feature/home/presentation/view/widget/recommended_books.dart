part of '../home_view.dart';

final class _RecommendedBooks extends StatelessWidget {
  const _RecommendedBooks();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.home_recommended_books,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          const CustomSizedBox(),
          const CustomSizedBox(),
          const _RecommendedBooksBloc(),
        ],
      ),
    );
  }
}

final class _RecommendedBooksBloc extends StatelessWidget {
  const _RecommendedBooksBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        return CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 1.2,
            enlargeCenterPage: true,
            initialPage: 2,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            scrollPhysics: const BouncingScrollPhysics(),
          ),
          itemCount: state.books?.items?.length ?? 0,
          itemBuilder: (
            BuildContext context,
            int itemIndex,
            int pageViewIndex,
          ) =>
              _RecommendedBookItem(
            books: state.books ?? const Books(),
            itemIndex: itemIndex,
          ),
        );
      },
    );
  }
}

final class _RecommendedBookItem extends StatelessWidget {
  const _RecommendedBookItem({
    required this.books,
    required this.itemIndex,
  });

  final Books books;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(
          BookDetailRoute(
            book: books.items?[itemIndex] ?? const Item(),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: 're ${books.items?[itemIndex].id}',
            child: CustomNetworkImage(
              imageUrl:
                  books.items?[itemIndex].volumeInfo?.imageLinks?.thumbnail ??
                      '',
              fit: BoxFit.fill,
              height: 0.32,
              icNoImageHeight: 0.32,
            ),
          ),
          const CustomSizedBox(),
          Text(
            textAlign: TextAlign.center,
            books.items?[itemIndex].volumeInfo?.title ?? '',
            style: context.textTheme.bodyLarge,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
