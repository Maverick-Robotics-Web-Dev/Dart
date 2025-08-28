import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class SignInTabletScreen extends StatefulWidget {
  final double maxWidth;
  final double maxHeight;
  final bool isKeyboardVisible;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInTabletScreen({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    required this.isKeyboardVisible,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignInTabletScreen> createState() => _SignInTabletScreenState();
}

class _SignInTabletScreenState extends State<SignInTabletScreen> {
  @override
  Widget build(BuildContext context) {
    final num sumsqsides = pow(widget.maxHeight, 2) + pow(widget.maxWidth, 2);
    final double diagonal = sqrt(sumsqsides);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              width: widget.maxWidth * 0.6,
              height: widget.maxHeight,
              child: Column(
                children: [
                  Container(
                    // alignment: Alignment.center,
                    height: widget.maxHeight * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo_valamy_wh.webp',
                          height: 80,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'PELETERIA VALAMY',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 36,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.asset('assets/images/sign_in_photo_3_wh.webp'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: widget.maxHeight * 0.15,
                    child: Text(
                      'Exclusividad y Sofisticación',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 30,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: widget.maxWidth * 0.4,
              height: widget.maxHeight,
              padding: EdgeInsets.symmetric(horizontal: 46),
              decoration: BoxDecoration(color: whiteColor),
              child: Column(
                children: [
                  Text(
                    '¡Bienvenido de Nuevo!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 34,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 26),
                  Text(
                    // "Log in with your data that you intered during your registration.",
                    'Inicia sesión con tus datos que ingresaste durante tu registro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 16.6,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
