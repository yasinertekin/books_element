import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/gen/colors.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 30,
            color: ColorName.lightThemeColor,
          ),
        ),
      ),
    );
  }
}
