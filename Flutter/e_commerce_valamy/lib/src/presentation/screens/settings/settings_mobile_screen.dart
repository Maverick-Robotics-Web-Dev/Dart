import 'package:flutter/material.dart';

class SettingsMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const SettingsMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: Center(
          child: Text(
            "Settings Mobile Screen",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
