import 'package:flutter/material.dart';

/// Custom Loading
final class CustomLoading extends StatelessWidget {
  /// Custom Loading Constructor
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
