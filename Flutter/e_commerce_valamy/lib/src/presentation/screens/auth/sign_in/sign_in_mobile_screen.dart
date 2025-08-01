import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInMobileScreen extends StatelessWidget {
  final double height;
  final double width;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInMobileScreen({
    super.key,
    required this.height,
    required this.width,
    this.textTheme,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [BackgroundImageTopMobile(), LogoLabelMobile()],
          ),
          Padding(
            padding: const EdgeInsets.all(h_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignInTitleMobile(),
                SizedBox(height: h_16 / 2),
                SignInSubtitleMobile(),
                SizedBox(height: 16),
                SignInFormMobile(formKey: formKey),
                ForgotPassTextButtonMobile(),
                SizedBox(height: height > 700 ? height * 0.1 : h_16),
                SignInButtonMobile(),
                DontAccountLabelMobile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImageTopMobile extends StatelessWidget {
  const BackgroundImageTopMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/sign_in_image_mobile.jpg',
      color: const Color.fromRGBO(13, 71, 161, 0.7),
      colorBlendMode: BlendMode.darken,
      fit: BoxFit.cover,
    );
  }
}

class LogoLabelMobile extends StatelessWidget {
  const LogoLabelMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo_valamy_blanco.png',
          width: 180,
          height: 180,
        ),
        Text(
          'Peleteria Valamy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
            letterSpacing: 1,
            // fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Exclusividad y Sofisticación',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 1,
            // fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class SignInTitleMobile extends StatelessWidget {
  const SignInTitleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '¡Bienvenido de Nuevo!',
      style: TextStyle(color: primaryColor, fontSize: 32, letterSpacing: 1),
    );
  }
}

class SignInSubtitleMobile extends StatelessWidget {
  const SignInSubtitleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      // "Log in with your data that you intered during your registration.",
      'Inicia sesión con tus datos que ingresaste durante tu registro',
      style: TextStyle(color: textColor, fontSize: 16, letterSpacing: 1),
    );
  }
}

class SignInFormMobile extends StatelessWidget {
  const SignInFormMobile({super.key, required this.formKey});

  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TxtFormFieldCustom(
            svgPath: "assets/icons/Message.svg",
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: h_16),
          TxtFormFieldCustom(
            svgPath: "assets/icons/Lock.svg",
            hintText: "Password",
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class ForgotPassTextButtonMobile extends StatelessWidget {
  const ForgotPassTextButtonMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {},
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(fontSize: font_16_6, letterSpacing: 1),
        ),
      ),
    );
  }
}

class SignInButtonMobile extends StatelessWidget {
  const SignInButtonMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 32)),
      child: Text(
        'Sign in',
        style: TextStyle(
          fontSize: font_16_6,
          // fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class DontAccountLabelMobile extends StatelessWidget {
  const DontAccountLabelMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes una cuenta?',
          style: TextStyle(
            color: textColor,
            fontSize: font_16_6,
            // fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: font_16_6,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
