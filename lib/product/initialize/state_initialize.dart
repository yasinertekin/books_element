import 'package:bloc_example/feature/auth/presentation/view_model/cubit/google_sign_in_cubit.dart';
import 'package:bloc_example/feature/index.dart';

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
        BlocProvider<GoogleSignInCubit>(
          create: (context) => Locator.googleSignInCubit,
        ),
        BlocProvider<LoginCubit>(
          create: (context) => Locator.loginCubit,
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => Locator.registerCubit,
        ),
        BlocProvider<TextFieldCubit>(
          create: (context) => Locator.textFieldCubit,
        ),
        BlocProvider<SearchBooksCubit>(
          create: (context) => Locator.booksCubit,
        ),
        BlocProvider<HomeCubit>(create: (context) => Locator.homeCubit),
      ],
      child: child,
    );
  }
}
