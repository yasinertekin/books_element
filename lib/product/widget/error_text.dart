import 'package:bloc_example/feature/index.dart';

final class ErrorText extends StatelessWidget {
  const ErrorText({
    required this.error,
    super.key,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
