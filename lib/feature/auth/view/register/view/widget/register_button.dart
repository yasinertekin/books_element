part of '../register_view.dart';

final class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    required this.formKey,
    required this.registerCubit,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final RegisterCubit registerCubit;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            registerCubit.register(
              email: emailController.text,
              password: passwordController.text,
            );
          }
        },
        child: Text(
          'Register',
          style: context.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
