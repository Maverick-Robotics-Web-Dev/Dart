import 'package:flutter/material.dart';

class HomeMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const HomeMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home Mobile Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
