import 'package:flutter/material.dart';

class CartTabletScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const CartTabletScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Cart Tablet Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
