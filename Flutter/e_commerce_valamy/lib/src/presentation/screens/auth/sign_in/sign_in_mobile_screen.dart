import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/text_form_field_custom.dart';
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
                LogoBox(maxHeight: widget.maxHeight, diagonal: diagonal),
                SizedBox(height: 20),
                ImageBox(maxHeight: widget.maxHeight),
                SizedBox(height: 20),
                TitleTextBox(diagonal: diagonal),
                SizedBox(height: 8),
                SubtitleTextBox(diagonal: diagonal),
                SizedBox(height: 40),
                FormBox(formKey: widget.formKey, diagonal: diagonal),
                SizedBox(height: 8),
                ForgetPasswordTextButtonBox(diagonal: diagonal),
                Spacer(),
                SignInButtonBox(diagonal: diagonal),
                SizedBox(height: 4),
                SignUpTextButtonBox(diagonal: diagonal),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoBox extends StatelessWidget {
  final double maxHeight;
  final double diagonal;

  const LogoBox({super.key, required this.maxHeight, required this.diagonal});

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
            child: Image.asset('assets/images/sign_in_photo_3_whi.webp'),
          ),
        ],
      ),
    );
  }
}

class TitleTextBox extends StatelessWidget {
  const TitleTextBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Text(
      '¡Bienvenido de Nuevo!',
      style: TextStyle(
        color: whiteColor,
        fontSize: diagonal * 0.0313,
        letterSpacing: 1,
      ),
    );
  }
}

class SubtitleTextBox extends StatelessWidget {
  const SubtitleTextBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Text(
      // "Log in with your data that you intered during your registration.",
      'Inicia sesión con los datos que te registraste',
      style: TextStyle(
        color: whiteColor,
        fontSize: diagonal * 0.0163,
        letterSpacing: 1,
      ),
    );
  }
}

class FormBox extends StatelessWidget {
  final double diagonal;
  final GlobalKey<FormState>? formKey;

  const FormBox({super.key, required this.formKey, required this.diagonal});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormFieldCustom(
            svgPath: "assets/icons/Message.svg",
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            fontSize: diagonal * 0.0163,
          ),
          SizedBox(height: 20),
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

class ForgetPasswordTextButtonBox extends StatelessWidget {
  const ForgetPasswordTextButtonBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        '¿Olvidaste tu contraseña?',
        style: TextStyle(
          color: whiteColor,
          fontSize: diagonal * 0.0163,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class SignInButtonBox extends StatelessWidget {
  const SignInButtonBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 32)),
      child: Text(
        'Iniciar Sesión',
        style: TextStyle(
          fontSize: diagonal * 0.0163,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class SignUpTextButtonBox extends StatelessWidget {
  const SignUpTextButtonBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes una cuenta?',
          style: TextStyle(
            color: whiteColor,
            fontSize: diagonal * 0.0163,
            letterSpacing: 1,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Registrate',
            style: TextStyle(
              color: whiteColor,
              fontSize: diagonal * 0.0163,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
