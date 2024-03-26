part of '../profile_view.dart';

final class _UserInfo extends StatelessWidget {
  const _UserInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _UserAvatar(),
        SizedBox(width: context.dynamicWidth(0.05)),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserName(),
            _UserStatistics(),
          ],
        ),
      ],
    );
  }
}
