import 'package:flutter/material.dart';

class SignInMobileScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final ThemeData appTheme;
  final GlobalKey<FormState>? formKey;

  const SignInMobileScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    required this.appTheme,
    this.formKey,
  });

  @override
  State<SignInMobileScreen> createState() => _SignInMobileScreenState();
}

class _SignInMobileScreenState extends State<SignInMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
