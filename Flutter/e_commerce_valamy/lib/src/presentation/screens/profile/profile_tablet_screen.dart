import 'package:flutter/material.dart';

class ProfileTabletScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const ProfileTabletScreen({super.key, this.textTheme});

  @override
  State<ProfileTabletScreen> createState() => _ProfileTabletScreenState();
}

class _ProfileTabletScreenState extends State<ProfileTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile Tablet Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
