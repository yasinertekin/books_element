import 'package:bloc_example/index.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';

part 'widget/login_button.dart';
part 'widget/login_view_title.dart';
part 'widget/register_button.dart';

/// Login View
@RoutePage()
final class LoginView extends StatelessWidget
    with ShowErrorMessageMixin, NavigationMixin {
  /// Login View Constructor
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (message) => showErrorMessage(context, message),
            success: () => navigateToNamedRoute(
              context,
              NavigationEnum.homeView.value,
            ),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const _LoginViewBody(),
            loading: () => const CustomLoading(),
          );
        },
      ),
    );
  }
}

final class _LoginViewBody extends StatelessWidget {
  const _LoginViewBody();

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Padding(
        padding: context.paddingAllDefault,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Assets.images.imgReadBook.image(),
              const _LoginViewTitle(),
              CustomTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validatorText: LocaleKeys.textFields_mailValidation.tr(),
                labelText: LocaleKeys.textFields_email.tr(),
              ),
              CustomTextField(
                controller: passwordController,
                labelText: LocaleKeys.textFields_password.tr(),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validatorText: LocaleKeys.textFields_passwordValidation.tr(),
              ),
              _LoginButton(
                formKey: formKey,
                loginCubit: loginCubit,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const CustomDivider(),
              const SignInMethods(),
              const _RegisterButton(),
            ],
          ).space(context.lowValue),
        ),
      ),
    );
  }
}
