part of '../profile_view.dart';

final class _LogOutButton extends StatelessWidget {
  const _LogOutButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.router.push(const LoginRoute());
        },
        child: Text(
          'Logout',
          style: context.textTheme.titleSmall?.copyWith(
            color: ColorName.colorWhite,
          ),
        ),
      ),
    );
  }
}
