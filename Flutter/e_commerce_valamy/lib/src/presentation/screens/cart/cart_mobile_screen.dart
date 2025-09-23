import 'package:flutter/material.dart';

class CartMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const CartMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Cart Mobile Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
