import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/login_cubit.dart';
import 'package:bloc_example/feature/auth/view_model/state/login_state.dart';
import 'package:bloc_example/gen/index.dart';
import 'package:bloc_example/product/core/constants/navigation_constants.dart';
import 'package:bloc_example/product/core/extensions/column_extension.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';
import 'package:bloc_example/product/initialize/language/locale_keys.g.dart';
import 'package:bloc_example/product/mixin/navigation_mixin.dart';
import 'package:bloc_example/product/mixin/show_error_message.dart';
import 'package:bloc_example/product/model/users.dart';
import 'package:bloc_example/product/widget/custom_divider.dart';
import 'package:bloc_example/product/widget/custom_loading.dart';
import 'package:bloc_example/product/widget/sign_in_methods.dart';
import 'package:bloc_example/product/widget/text_field/view/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
