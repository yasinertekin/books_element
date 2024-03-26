part of '../profile_view.dart';

final class _UserName extends StatelessWidget {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingAllLow,
          child: Text(
            FirebaseAuth.instance.currentUser?.displayName ?? 'Name Surname',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorName.colorBlue,
            ),
          ),
        ),
      ],
    );
  }
}
