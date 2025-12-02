import 'package:flutter/material.dart';

class MainMobileScreen extends StatefulWidget {
  final ThemeData appTheme;

  const MainMobileScreen({super.key, required this.appTheme});

  @override
  State<MainMobileScreen> createState() => _MainMobileScreenState();
}

class _MainMobileScreenState extends State<MainMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'MAIN SCREEN',
          style: widget.appTheme.textTheme.headlineLarge,
        ),
      ),
    );
  }
}
