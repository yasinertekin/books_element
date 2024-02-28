import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/register_cubit.dart';
import 'package:bloc_example/feature/auth/view_model/state/register_state.dart';
import 'package:bloc_example/gen/assets.gen.dart';
import 'package:bloc_example/gen/colors.gen.dart';
import 'package:bloc_example/product/core/constants/navigation_constants.dart';
import 'package:bloc_example/product/core/extensions/column_extension.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';
import 'package:bloc_example/product/initialize/language/locale_keys.g.dart';
import 'package:bloc_example/product/mixin/navigation_mixin.dart';
import 'package:bloc_example/product/mixin/show_error_message.dart';
import 'package:bloc_example/product/widget/custom_divider.dart';
import 'package:bloc_example/product/widget/custom_loading.dart';
import 'package:bloc_example/product/widget/sign_in_methods.dart';
import 'package:bloc_example/product/widget/text_field/view/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget/login_button.dart';
part 'widget/register_button.dart';
part 'widget/register_title.dart';

/// Register View
@RoutePage()
final class RegisterView extends StatelessWidget
    with ShowErrorMessageMixin, NavigationMixin {
  /// Register View Constructor
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {
              return;
            },
            error: (message) => showErrorMessage(context, message),
            success: () => navigateToNamedRoute(
              context,
              NavigationEnum.homeView.value,
            ),
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

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Stack(
          children: [
            Assets.images.imgHeader.image(),
            Padding(
              padding: context.paddingAllDefault.copyWith(
                top: context.height * 0.13,
              ),
              child: Column(
                children: [
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
                    validatorText:
                        LocaleKeys.textFields_passwordValidation.tr(),
                  ),
                  CustomTextField(
                    controller: repeatPasswordController,
                    labelText: LocaleKeys.textFields_repeatPassword.tr(),
                    validatorText:
                        LocaleKeys.textFields_passwordValidation.tr(),
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
              ).space(
                context.height * 0.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
