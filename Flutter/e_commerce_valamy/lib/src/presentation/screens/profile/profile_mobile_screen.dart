import 'package:flutter/material.dart';

class ProfileMobileScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const ProfileMobileScreen({super.key, this.textTheme});

  @override
  State<ProfileMobileScreen> createState() => _ProfileMobileScreenState();
}

class _ProfileMobileScreenState extends State<ProfileMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Text(
            "Profile Mobile Screen",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
