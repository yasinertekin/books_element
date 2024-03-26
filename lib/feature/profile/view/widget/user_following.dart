part of '../profile_view.dart';

final class _UserFollowing extends StatelessWidget {
  const _UserFollowing();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '7',
          style: context.textTheme.titleMedium?.copyWith(
            color: ColorName.colorBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Following',
          style: context.textTheme.titleMedium?.copyWith(
            color: ColorName.colorBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
