import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome', style: TextStyle(fontSize: 26)),
          Text('back...', style: TextStyle(fontSize: 26)),
          Text('Sign In', style: TextStyle(fontSize: 22)),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              label: Text('Email'),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.key),
              label: Text('Password'),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Sign In')),
        ],
      ),
    );
  }
}
