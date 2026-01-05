import 'package:flutter/material.dart';

class CheckAuthStatusMobileScreen extends StatelessWidget {
  final ThemeData appTheme;

  const CheckAuthStatusMobileScreen({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}
