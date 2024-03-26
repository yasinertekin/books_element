import 'package:bloc_example/feature/auth/presentation/view_model/cubit/google_sign_in_cubit.dart';
import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/core/extensions/show_error_extension.dart';

/// Sign In Methods
final class SignInMethods extends StatelessWidget {
  /// Sign In Methods Constructor
  const SignInMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _GoogleSignInButton(),
          SizedBox(width: context.dynamicWidth(0.02)),
          const _FacebookButton(),
        ],
      ),
    );
  }
}

final class _FacebookButton extends StatelessWidget {
  const _FacebookButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        child: const Text('Facebook'),
      ),
    );
  }
}

final class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (message) => context.showErrorMessage(message),
          success: () =>
              context.navigateNamedTo(NavigationEnum.navBarView.value),
        );
      },
      builder: (context, state) {
        return Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.read<GoogleSignInCubit>().googleSignIn(
                    context,
                  );
            },
            child: const Text('Google'),
          ),
        );
      },
    );
  }
}
