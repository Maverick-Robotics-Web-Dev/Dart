import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class SignInTabletScreen extends StatelessWidget {
  final double? height;
  final double? width;

  const SignInTabletScreen({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(color: const Color.fromRGBO(33, 150, 243, 0.2)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(50),
              color: primaryColor,
              child: Column(children: [Text('Additional Content')]),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
              child: Column(children: [Text('Additional Content')]),
            ),
          ),
        ],
      ),
    );
  }
}
