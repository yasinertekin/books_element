import 'package:bloc_example/feature/index.dart';

@RoutePage()

/// Home View
final class HomeView extends StatelessWidget with NavigationMixin {
  /// Home View Constructor
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
