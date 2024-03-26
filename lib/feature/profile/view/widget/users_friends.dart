part of '../profile_view.dart';

final class _UserFriends extends StatelessWidget {
  const _UserFriends();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '3,000',
          style: context.textTheme.titleMedium?.copyWith(
            color: ColorName.colorBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Friends',
          style: context.textTheme.titleMedium?.copyWith(
            color: ColorName.colorBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
