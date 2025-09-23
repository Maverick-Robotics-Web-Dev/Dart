import 'package:flutter/material.dart';

class MainTabletScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const MainTabletScreen({super.key, this.textTheme});

  @override
  State<MainTabletScreen> createState() => _MainTabletScreenState();
}

class _MainTabletScreenState extends State<MainTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Main Tablet Screen',
          style: widget.textTheme?.headlineLarge,
        ),
      ),
    );
  }
}
