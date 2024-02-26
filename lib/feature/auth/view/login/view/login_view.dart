import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/feature/auth/view/login/mixin/login_view_mixin.dart';
import 'package:bloc_example/feature/auth/view/register/view/register_view.dart';
import 'package:bloc_example/feature/auth/view_model/cubit/login_cubit.dart';
import 'package:bloc_example/feature/auth/view_model/state/login_state.dart';
import 'package:bloc_example/feature/home/home_view.dart';
import 'package:bloc_example/product/model/users.dart';
import 'package:bloc_example/product/widget/custom_loading.dart';
import 'package:bloc_example/product/widget/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget/login_button.dart';

/// Login View
@RoutePage()
final class LoginView extends StatelessWidget with LoginViewMixin<LoginView> {
  /// Login View Constructor
  LoginView({super.key});

  @override
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void navigateToHome(BuildContext context) {
    Navigator.of(context).push<Widget>(
      MaterialPageRoute<Widget>(
        builder: (context) => const HomeView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (message) => showErrorMessage(context, message),
            success: () => navigateToHome(context),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validatorText: 'Please enter a email',
          ),
          CustomTextField(
            controller: passwordController,
            labelText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validatorText: 'Please enter a  password',
          ),
          _LoginButton(
            formKey: formKey,
            loginCubit: loginCubit,
            emailController: emailController,
            passwordController: passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push<Widget>(
                MaterialPageRoute<Widget>(
                  builder: (context) => const RegisterView(),
                ),
              );
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
