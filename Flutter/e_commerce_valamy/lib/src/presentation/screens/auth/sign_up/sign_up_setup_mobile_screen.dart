import 'package:flutter/material.dart';

class SignUpSetupMobileScreen extends StatefulWidget {
  const SignUpSetupMobileScreen({super.key});

  @override
  State<SignUpSetupMobileScreen> createState() =>
      _SignUpSetupMobileScreenState();
}

class _SignUpSetupMobileScreenState extends State<SignUpSetupMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('MOBILE')],
          ),
        ),
      ),
    );
  }
}
