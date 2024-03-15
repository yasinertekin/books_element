part of '../home_view.dart';

final class _FavoriteBookEmptyWidget extends StatelessWidget {
  const _FavoriteBookEmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No favorite book'),
    );
  }
}
