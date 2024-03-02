import 'dart:math';

import 'package:bloc_example/feature/index.dart';

@RoutePage()

/// Home View
final class HomeView extends StatelessWidget with NavigationMixin {
  /// Home View Constructor
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final randomNumber = Random().nextInt(100);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Random Number: $randomNumber',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
