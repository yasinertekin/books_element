import 'package:bloc_example/index.dart';

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
        BlocProvider(
          create: (context) => Locator.googleSignInCubit,
        ),
      ],
      child: child,
    );
  }
}
