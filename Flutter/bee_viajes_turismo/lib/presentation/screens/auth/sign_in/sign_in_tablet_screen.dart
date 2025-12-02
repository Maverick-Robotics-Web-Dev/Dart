import 'package:flutter/material.dart';

class SignInTabletScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final ThemeData appTheme;
  final GlobalKey<FormState>? formKey;

  const SignInTabletScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    required this.appTheme,
    this.formKey,
  });

  @override
  State<SignInTabletScreen> createState() => _SignInTabletScreenState();
}

class _SignInTabletScreenState extends State<SignInTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
