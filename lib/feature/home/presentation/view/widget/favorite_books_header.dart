part of '../home_view.dart';

final class _FavoriteBooksHeader extends StatelessWidget {
  const _FavoriteBooksHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.home_favorite_books,
      style: context.textTheme.headlineLarge,
    ).tr();
  }
}
