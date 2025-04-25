import 'package:flutter/material.dart';
import 'package:indriver_clone/src/presentation/screens/sign_in/sign_in_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InDriver Clone',
      home: SignInScreen(),
    );
  }
}
