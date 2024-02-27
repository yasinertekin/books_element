import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()

/// Home View
final class HomeView extends StatelessWidget {
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
