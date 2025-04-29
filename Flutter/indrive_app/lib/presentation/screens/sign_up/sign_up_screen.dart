import 'package:flutter/material.dart';
import 'package:indrive_app/presentation/screens/sign_up/sign_up_body.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SignUpBody()));
  }
}
