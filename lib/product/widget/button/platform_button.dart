import 'dart:io';

import 'package:bloc_example/feature/index.dart';
import 'package:flutter/cupertino.dart';

abstract final class PlatformButton {
  factory PlatformButton() {
    if (Platform.isAndroid) {
      return AndroidButton();
    } else if (Platform.isIOS) {
      return IOSButton();
    } else {
      return AndroidButton();
    }
  }
  Widget build({required VoidCallback onPressed, required Widget child});
}

final class IOSButton implements PlatformButton {
  @override
  Widget build({required VoidCallback onPressed, required Widget child}) =>
      CupertinoButton(
        onPressed: onPressed,
        child: child,
      );
}

final class AndroidButton implements PlatformButton {
  @override
  Widget build({required VoidCallback onPressed, required Widget child}) =>
      ElevatedButton(
        onPressed: onPressed,
        child: child,
      );
}

/// Abstract component class
/// [ProductCard] is the base class for all concrete components, including
abstract final class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context);
}

/// Concrete component class
/// [SimpleProductCard] is a simple product card with an image, name, and price.
@reopen
base class SimpleProductCard extends ProductCard {
  const SimpleProductCard({
    required this.imageUrl,
    required this.productName,
    required this.price,
    super.key,
  });
  final String imageUrl;
  final String productName;
  final double price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Image.network(imageUrl, height: 150, width: 150),
          Text(productName),
          Text('$price'),
        ],
      ),
    );
  }
}
