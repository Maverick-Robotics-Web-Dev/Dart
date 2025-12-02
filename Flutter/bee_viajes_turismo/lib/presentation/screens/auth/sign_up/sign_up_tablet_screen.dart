import 'package:flutter/material.dart';

class SignUpTabletScreen extends StatefulWidget {
  final ThemeData appTheme;
  final GlobalKey<FormState>? formKey;
  const SignUpTabletScreen({super.key, required this.appTheme, this.formKey});

  @override
  State<SignUpTabletScreen> createState() => _SignUpTabletScreenState();
}

class _SignUpTabletScreenState extends State<SignUpTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
