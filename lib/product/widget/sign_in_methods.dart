import 'package:bloc_example/feature/auth/view_model/cubit/google_sign_in_cubit.dart';
import 'package:bloc_example/feature/auth/view_model/state/google_sign_in_state.dart';
import 'package:bloc_example/feature/index.dart';

/// Sign In Methods
final class SignInMethods extends StatelessWidget
    with ShowErrorMessageMixin, NavigationMixin {
  /// Sign In Methods Constructor
  const SignInMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      width: context.width,
      child: BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (message) => showErrorMessage(context, message),
            success: () => navigateToNamedRoute(
              context,
              NavigationEnum.navBarView.value,
            ),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Padding(
              padding: context.paddingAllLow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<GoogleSignInCubit>().googleSignIn(
                              context,
                            );
                      },
                      child: const Text('Google'),
                    ),
                  ),
                  SizedBox(width: context.dynamicWidth(0.02)),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Facebook'),
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const CustomLoading(),
          );
        },
      ),
    );
  }
}
