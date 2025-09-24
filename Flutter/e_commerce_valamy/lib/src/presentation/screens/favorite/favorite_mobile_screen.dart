import 'package:flutter/material.dart';

class FavoriteMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const FavoriteMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            "Favorite Mobile Screen",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
