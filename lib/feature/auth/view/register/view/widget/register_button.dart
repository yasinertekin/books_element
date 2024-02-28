part of '../register_view.dart';

final class _RegisterButton extends StatelessWidget with ShowErrorMessageMixin {
  const _RegisterButton({
    required this.formKey,
    required this.registerCubit,
    required this.emailController,
    required this.passwordController,
    required this.repeatPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final RegisterCubit registerCubit;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _chechFormKeyStateAndPasswordController(context);
        },
        child: Text(
          LocaleKeys.buttons_register,
          style: context.textTheme.headlineSmall,
        ).tr(),
      ),
    );
  }

  void _chechFormKeyStateAndPasswordController(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      if (passwordController.text == repeatPasswordController.text) {
        registerCubit.register(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        showErrorMessage(context, 'Password does not match');
      }
    }
  }
}
