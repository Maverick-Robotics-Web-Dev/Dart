import 'package:flutter/material.dart';

class SignInTabletScreen extends StatelessWidget {
  const SignInTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue.shade300,
            child: Column(children: [Text('Tablet Sign In Screen')]),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.orange.shade300,
            child: Column(children: [Text('Additional Content')]),
          ),
        ),
      ],
    );
  }
}
