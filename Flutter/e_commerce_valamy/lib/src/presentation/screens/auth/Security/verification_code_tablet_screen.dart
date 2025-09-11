import 'package:flutter/material.dart';

class VerificationCodeTabletScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const VerificationCodeTabletScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    this.textTheme,
    this.formKey,
  });

  @override
  State<VerificationCodeTabletScreen> createState() =>
      _VerificationCodeTabletScreenState();
}

class _VerificationCodeTabletScreenState
    extends State<VerificationCodeTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
