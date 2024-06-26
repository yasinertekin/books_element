import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';
import 'package:bloc_example/product/core/extensions/show_error_extension.dart';
import 'package:bloc_example/product/widget/custom_sized_box.dart';

part 'widget/login_button.dart';
part 'widget/register_button.dart';
part 'widget/register_title.dart';
part 'widget/register_view_background_image.dart';

/// Register View
@RoutePage()
final class RegisterView extends StatelessWidget {
  /// Register View Constructor
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) => previous != current,
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (message) => context.showErrorMessage(message),
            success: () =>
                context.navigateNamedTo(NavigationEnum.navBarView.value),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const _RegisterViewBody(),
            loading: () => const CustomLoading(),
          );
        },
      ),
    );
  }
}

final class _RegisterViewBody extends StatelessWidget {
  const _RegisterViewBody();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final repeatPasswordController = TextEditingController();

    return Stack(
      children: [
        const _RegisterViewBackgroundImage(),
        _RegisterForm(
          emailController: emailController,
          passwordController: passwordController,
          repeatPasswordController: repeatPasswordController,
          formKey: formKey,
          registerCubit: registerCubit,
        ),
      ],
    );
  }
}

final class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    required this.emailController,
    required this.passwordController,
    required this.repeatPasswordController,
    required this.formKey,
    required this.registerCubit,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;
  final GlobalKey<FormState> formKey;
  final RegisterCubit registerCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllLow,
          child: Column(
            children: [
              const CustomSizedBox(
                height: 0.1,
              ),
              const _RegisterTitle(),
              CustomTextField(
                controller: emailController,
                validatorText: LocaleKeys.textFields_mailValidation.tr(),
                keyboardType: TextInputType.emailAddress,
                labelText: LocaleKeys.textFields_email.tr(),
              ),
              CustomTextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                labelText: LocaleKeys.textFields_password.tr(),
                validatorText: LocaleKeys.textFields_passwordValidation.tr(),
              ),
              CustomTextField(
                controller: repeatPasswordController,
                labelText: LocaleKeys.textFields_repeatPassword.tr(),
                validatorText: LocaleKeys.textFields_passwordValidation.tr(),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
              _RegisterButton(
                formKey: formKey,
                registerCubit: registerCubit,
                emailController: emailController,
                passwordController: passwordController,
                repeatPasswordController: repeatPasswordController,
              ),
              const CustomDivider(),
              const SignInMethods(),
              const Text(LocaleKeys.register_alreadyHaveAccount).tr(),
              const _LogInButton(),
            ],
          ).space(0.02),
        ),
      ),
    );
  }
}
