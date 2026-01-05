import 'package:flutter/material.dart';

class CheckAuthStatusTabletScreen extends StatelessWidget {
  final ThemeData appTheme;

  const CheckAuthStatusTabletScreen({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorScheme.surface,
      body: const Center(child: Text('Check Auth Status Tablet Screen')),
    );
  }
}
