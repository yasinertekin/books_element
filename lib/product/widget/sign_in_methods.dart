import 'package:bloc_example/index.dart';

/// Sign In Methods
final class SignInMethods extends StatelessWidget {
  /// Sign In Methods Constructor
  const SignInMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: const Text('Google'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Facebook'),
        ),
      ],
    );
  }
}
