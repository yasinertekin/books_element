import 'package:bloc_example/feature/auth/view_model/cubit/google_sign_in_cubit.dart';
import 'package:bloc_example/feature/auth/view_model/state/google_sign_in_state.dart';
import 'package:bloc_example/index.dart';

@RoutePage()
class DevemeView extends StatelessWidget
    with ShowErrorMessageMixin, NavigationMixin {
  const DevemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
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
            orElse: () => OutlinedButton(
              onPressed: () {
                context.read<GoogleSignInCubit>().googleSignIn(context);
              },
              child: const Text('Google'),
            ),
          );
        },
      ),
    );
  }
}
