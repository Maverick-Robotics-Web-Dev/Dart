import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/text_form_field_custom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpMobileScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignUpMobileScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignUpMobileScreen> createState() => _SignUpMobileScreenState();
}

class _SignUpMobileScreenState extends State<SignUpMobileScreen> {
  @override
  Widget build(BuildContext context) {
    final num sumsqsides = pow(widget.maxHeight, 2) + pow(widget.maxWidth, 2);
    final double diagonal = sqrt(sumsqsides);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: widget.maxHeight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                LogoBox(diagonal: diagonal),
                ImageBox(maxHeight: widget.maxHeight),
                Text(
                  '¡Comencemos!',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.0313,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Por favor ingrese sus datos válidos para crear una cuenta.',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.0163,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 20),
                FormBox(diagonal: diagonal, formKey: widget.formKey),
                SizedBox(height: 16),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(value: false, onChanged: (value) {}),
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Acepto los",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: diagonal * 0.0163,
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
                                color: whiteColor,
                                fontSize: diagonal * 0.0163,
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
                  ),
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                      fontSize: diagonal * 0.0163,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿Tienes una cuenta?",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: diagonal * 0.0163,
                        // fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: diagonal * 0.0163,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoBox extends StatelessWidget {
  final double diagonal;

  const LogoBox({super.key, required this.diagonal});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo_valamy_wh.webp', height: 48),
        SizedBox(width: 10),
        Text(
          'PELETERIA VALAMY',
          style: TextStyle(
            color: whiteColor,
            fontSize: diagonal * 0.0294,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}

class ImageBox extends StatelessWidget {
  final double maxHeight;

  const ImageBox({super.key, required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight > 760 ? maxHeight * 0.35 : maxHeight * 0.21,
      child: Column(
        children: [
          Expanded(
            child: Image.asset('assets/images/sign_up_photo_3_whi.webp'),
          ),
        ],
      ),
    );
  }
}

class FormBox extends StatelessWidget {
  final double diagonal;
  final GlobalKey<FormState>? formKey;

  const FormBox({super.key, required this.diagonal, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormFieldCustom(
            hintText: "Email",
            svgPath: "assets/icons/Message.svg",
            keyboardType: TextInputType.emailAddress,
            fontSize: diagonal * 0.0163,
          ),
          SizedBox(height: 16),
          TextFormFieldCustom(
            svgPath: "assets/icons/Lock.svg",
            hintText: "Password",
            obscureText: true,
            fontSize: diagonal * 0.0163,
          ),
        ],
      ),
    );
  }
}
