part of '../profile_view.dart';

final class _LogOutButton extends StatelessWidget {
  const _LogOutButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.push(const LoginRoute());
      },
      child: const Text('Logout'),
    );
  }
}
