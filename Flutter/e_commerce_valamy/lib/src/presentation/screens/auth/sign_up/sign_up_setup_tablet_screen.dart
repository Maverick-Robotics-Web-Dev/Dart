import 'package:flutter/material.dart';

class SignUpSetupTabletScreen extends StatefulWidget {
  const SignUpSetupTabletScreen({super.key});

  @override
  State<SignUpSetupTabletScreen> createState() =>
      _SignUpSetupTabletScreenState();
}

class _SignUpSetupTabletScreenState extends State<SignUpSetupTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Center(child: Text('TABLET'))),
    );
  }
}
