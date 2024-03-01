import 'package:bloc_example/feature/index.dart';

@RoutePage()

/// Home View
final class HomeView extends StatelessWidget with NavigationMixin {
  /// Home View Constructor
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToNamedRoute(context, NavigationEnum.searchView.value);
        },
        child: const Icon(Icons.search),
      ),
      body: const Center(
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
