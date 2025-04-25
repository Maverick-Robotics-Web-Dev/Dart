import 'package:flutter/material.dart';
import 'package:indriver_clone/src/presentation/screens/sign_in/sign_in_body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignInBody());
  }
}
