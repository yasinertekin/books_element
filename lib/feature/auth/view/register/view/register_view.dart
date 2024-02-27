import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/register_cubit.dart';
import 'package:bloc_example/feature/auth/view_model/state/register_state.dart';
import 'package:bloc_example/product/core/constants/navigation_constants.dart';
import 'package:bloc_example/product/core/extensions/contex_extension.dart';
import 'package:bloc_example/product/mixin/navigation_mixin.dart';
import 'package:bloc_example/product/mixin/show_error_message.dart';
import 'package:bloc_example/product/widget/custom_loading.dart';
import 'package:bloc_example/product/widget/text_field/view/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            orElse: () {},
            error: (message) => showErrorMessage(context, message),
            success: () => navigateToNamedRoute(
              context,
              NavigationConstants.homeView,
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

    return Form(
      key: formKey,
      child: Center(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                validatorText: 'Please enter your email',
              ),
              CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                validatorText: 'Please enter your password',
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    registerCubit.register(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
