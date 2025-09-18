import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInTabletScreen extends StatefulWidget {
  final double maxWidth;
  final double maxHeight;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInTabletScreen({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
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
        child: SizedBox(
          height: widget.maxHeight,
          child: Row(
            children: [
              LeftBox(maxWidth: widget.maxWidth, diagonal: diagonal),
              RightBox(
                maxWidth: widget.maxWidth,
                diagonal: diagonal,
                formKey: widget.formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeftBox extends StatelessWidget {
  final double maxWidth;
  final double diagonal;

  const LeftBox({super.key, required this.diagonal, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth * 0.5,
      padding: EdgeInsets.only(top: 40, bottom: 40, left: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
          Expanded(
            child: Image.asset('assets/images/sign_in_photo_3_whi.webp'),
          ),
          Text(
            'Exclusividad y Sofisticación',
            style: TextStyle(
              color: whiteColor,
              fontSize: diagonal * 0.0203,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class RightBox extends StatelessWidget {
  final double maxWidth;
  final double diagonal;
  final GlobalKey<FormState>? formKey;

  const RightBox({
    super.key,
    required this.diagonal,
    required this.maxWidth,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¡Bienvenido de Nuevo!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: whiteColor,
              fontSize: diagonal * 0.023,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 20),
          Text(
            // "Log in with your data that you intered during your registration.",
            'Inicia sesión con tus datos que ingresaste durante tu registro',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: whiteColor,
              fontSize: diagonal * 0.01122,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 80),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormFieldCustom(
                  svgPath: "assets/icons/Message.svg",
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 40),
                TextFormFieldCustom(
                  svgPath: "assets/icons/Lock.svg",
                  hintText: "Password",
                  obscureText: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Align(
            child: TextButton(
              onPressed: () {},
              child: Text(
                '¿Olvidaste tu contraseña?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: diagonal * 0.01122,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 32),
              backgroundColor: primaryColor,
            ),
            child: Text(
              'Iniciar Sesión',
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
                  color: whiteColor,
                  fontSize: diagonal * 0.01122,
                  letterSpacing: 1,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Registrate',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.01122,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
