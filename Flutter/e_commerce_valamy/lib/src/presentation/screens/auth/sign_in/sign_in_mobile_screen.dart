import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class SignInMobileScreen extends StatelessWidget {
  final double? height;
  final double? width;

  const SignInMobileScreen({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sign_in_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: transparentWhite),
        ),
      ],
    );
  }
}
