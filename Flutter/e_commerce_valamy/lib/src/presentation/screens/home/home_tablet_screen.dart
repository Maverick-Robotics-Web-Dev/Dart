import 'package:flutter/material.dart';

class HomeTabletScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const HomeTabletScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home Tablet Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
