import 'package:flutter/material.dart';

class FavoriteTabletScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const FavoriteTabletScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favorite Tablet Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
