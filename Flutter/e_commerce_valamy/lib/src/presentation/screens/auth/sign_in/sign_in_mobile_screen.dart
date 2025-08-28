import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInMobileScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInMobileScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignInMobileScreen> createState() => _SignInMobileScreenState();
}

class _SignInMobileScreenState extends State<SignInMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoBox(maxHeight: widget.maxHeight, maxWidth: widget.maxWidth),
            ImageBox(maxHeight: widget.maxHeight),
            FormBox(maxHeight: widget.maxHeight, formKey: widget.formKey),
          ],
        ),
      ),
    );
  }
}

class LogoBox extends StatelessWidget {
  final double maxHeight;
  final double maxWidth;

  const LogoBox({super.key, required this.maxHeight, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final sumsqsides = pow(maxHeight, 2) + pow(maxWidth, 2);
    final diagonal = sqrt(sumsqsides) * 0.030;
    print('Diagonal: $diagonal');
    return Container(
      alignment: Alignment.center,
      height: maxHeight * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_valamy_wh.webp', height: 48),
          SizedBox(width: 10),
          Text(
            'PELETERIA VALAMY',
            style: TextStyle(
              color: whiteColor,
              fontSize: diagonal,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({super.key, required this.maxHeight});

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight * 0.35,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/sign_in_photo_3_wh.webp')),
        ],
      ),
    );
  }
}

class FormBox extends StatelessWidget {
  const FormBox({super.key, required this.maxHeight, required this.formKey});

  final double maxHeight;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight > 760 ? maxHeight * 0.55 : maxHeight * 0.90,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '¡Bienvenido de Nuevo!',
              style: TextStyle(
                color: whiteColor,
                fontSize: 32,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 8),
            Text(
              // "Log in with your data that you intered during your registration.",
              'Inicia sesión con tus datos que ingresaste durante tu registro',
              style: TextStyle(
                color: whiteColor,
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TxtFormFieldCustom(
                    svgPath: "assets/icons/Message.svg",
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  TxtFormFieldCustom(
                    svgPath: "assets/icons/Lock.svg",
                    hintText: "Password",
                    obscureText: true,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: font_16_6,
                  letterSpacing: 1,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 32),
              ),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: font_16_6,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
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
                    fontSize: font_16_6,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Registrate',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: font_16_6,
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
    );
  }
}
