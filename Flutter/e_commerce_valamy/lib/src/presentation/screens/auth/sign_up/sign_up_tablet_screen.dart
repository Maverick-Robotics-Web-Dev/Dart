import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpTabletScreen extends StatefulWidget {
  final double maxWidth;
  final double maxHeight;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignUpTabletScreen({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignUpTabletScreen> createState() => _SignUpTabletScreenState();
}

class _SignUpTabletScreenState extends State<SignUpTabletScreen> {
  @override
  Widget build(BuildContext context) {
    final num sumsqsides = pow(widget.maxHeight, 2) + pow(widget.maxWidth, 2);
    final double diagonal = sqrt(sumsqsides);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Row(
          children: [
            LeftBox(
              maxWidth: widget.maxWidth,
              maxHeight: widget.maxHeight,
              diagonal: diagonal,
            ),
            RightBox(
              maxWidth: widget.maxWidth,
              maxHeight: widget.maxHeight,
              diagonal: diagonal,
              formKey: widget.formKey,
            ),
          ],
        ),
      ),
    );
  }
}

class LeftBox extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final double diagonal;

  const LeftBox({
    super.key,
    required this.diagonal,
    required this.maxWidth,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth * 0.6,
      height: maxHeight,
      child: Column(
        children: [
          SizedBox(
            height: maxHeight * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo_valamy_wh.webp', height: 80),
                SizedBox(width: 20),
                Text(
                  'PELETERIA VALAMY',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.02432,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset('assets/images/sign_up_photo_3_whi.webp'),
          ),
          Container(
            alignment: Alignment.center,
            height: maxHeight * 0.15,
            child: Text(
              'Exclusividad y Sofisticación',
              style: TextStyle(
                color: whiteColor,
                fontSize: diagonal * 0.0203,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightBox extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final double diagonal;
  final GlobalKey<FormState>? formKey;

  const RightBox({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    required this.diagonal,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth * 0.4,
      height: maxHeight,
      child: Container(
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.symmetric(vertical: 46, horizontal: 26),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              '¡Comencemos!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                // color: whiteColor,
                fontSize: diagonal * 0.023,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 26),
            Text(
              // "Log in with your data that you intered during your registration.",
              'Por favor ingrese sus datos válidos para crear una cuenta.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                // color: whiteColor,
                fontSize: diagonal * 0.01122,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 40),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TxtFormFieldCustom(
                    svgPath: "assets/icons/Message.svg",
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 40),
                  TxtFormFieldCustom(
                    svgPath: "assets/icons/Lock.svg",
                    hintText: "Password",
                    obscureText: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Transform.scale(
                  scale: 1.1,
                  child: Checkbox(value: false, onChanged: (value) {}),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Acepto los",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: diagonal * 0.01122,
                        // fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                      children: [
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   termsOfServicesScreenRoute,
                                  // );
                                },
                          text: " Terminos y Condiciones ",
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: diagonal * 0.01122,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 32),
                backgroundColor: primaryColor,
              ),
              child: Text(
                'Continuar',
                style: TextStyle(
                  fontSize: diagonal * 0.0122,
                  letterSpacing: 1,
                  color: whiteColor,
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿No tienes una cuenta?',
                  style: TextStyle(
                    color: secondaryColor,
                    // color: whiteColor,
                    fontSize: diagonal * 0.01122,
                    letterSpacing: 1,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Registrate',
                    style: TextStyle(
                      color: secondaryColor,
                      // color: whiteColor,
                      fontSize: diagonal * 0.01122,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
