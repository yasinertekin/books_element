part of '../profile_view.dart';
final class _BookCount extends StatelessWidget {
  const _BookCount();
  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<Item>>(
      selector: (state) => state.favoriteBooks,
      builder: (context, state) => Column(
        children: [
          Text(
            '${state.length}',
            style: context.textTheme.titleMedium?.copyWith(
              color: ColorName.colorBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Books',
            style: context.textTheme.titleMedium?.copyWith(
              color: ColorName.colorBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
