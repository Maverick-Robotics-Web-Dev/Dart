import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInMobileScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              height: maxHeight * 0.072,
              // padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo_valamy_bl.webp', height: 48),
                  SizedBox(width: 10),
                  Text(
                    'PELETERIA VALAMY',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.blue,
              height: maxHeight * 0.364,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/sign_in_photo_3_wh_mobile.webp',
                      // fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.purple,
              height: maxHeight * 0.564,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      '¡Bienvenido de Nuevo!',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      // "Log in with your data that you intered during your registration.",
                      'Inicia sesión con tus datos que ingresaste durante tu registro',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 16),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TxtFormFieldCustom(
                            svgPath: "assets/icons/Message.svg",
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 26),
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
                        style: TextStyle(fontSize: font_16_6, letterSpacing: 1),
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
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
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
                            'Registrate',
                            style: TextStyle(
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
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundImageTopMobile extends StatelessWidget {
  final double height;

  const BackgroundImageTopMobile({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/images/sign_in_image_mobile.jpg',
        color: const Color.fromRGBO(13, 71, 161, 0.7),
        colorBlendMode: BlendMode.darken,
        fit: BoxFit.fill,
      ),
    );
  }
}

class SignInImageMobile extends StatelessWidget {
  final double height;
  final GlobalKey? keyWidget;
  const SignInImageMobile({super.key, required this.height, this.keyWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: 220,
          height: 40,
          margin: EdgeInsets.only(top: 26, bottom: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Text(
            'PELETERIA VALAMY',
            style: TextStyle(color: primaryColor, fontSize: 20),
          ),
        ),
        Align(
          child: Column(
            children: [
              SizedBox(
                key: keyWidget,
                // width: double.infinity,
                height: 200,
                child: Image.asset(
                  'assets/images/sign_in_photo_3_wh_mobile.webp',
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Exclusividad y Sofisticación ',
                style: TextStyle(color: whiteColor, fontSize: 18),
              ),
            ],
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
    return Align(
      child: Text(
        '¡Bienvenido de Nuevo!',
        style: TextStyle(color: primaryColor, fontSize: 32, letterSpacing: 1),
      ),
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
          SizedBox(height: 26),
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
        'Iniciar Sesión',
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
            'Registrate',
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
