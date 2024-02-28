import 'package:bloc_example/feature/auth/view_model/cubit/login_cubit.dart';
import 'package:bloc_example/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// State Initialize
final class StateInitialize extends StatelessWidget {
  /// State Initialize Constructor
  const StateInitialize({required this.child, super.key});

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => Locator.loginCubit,
        ),
        BlocProvider(
          create: (context) => Locator.registerCubit,
        ),
        BlocProvider(
          create: (context) => Locator.textFieldCubit,
        ),
      ],
      child: child,
    );
  }
}
