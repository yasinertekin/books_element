part of '../login_view.dart';

final class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.formKey,
    required this.loginCubit,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final LoginCubit loginCubit;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          loginCubit.signInWithEmailAndPassword(
            Users(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
        }
      },
      child: const Text('Login'),
    );
  }
}
