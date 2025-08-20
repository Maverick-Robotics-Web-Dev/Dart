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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: whiteColor,
        // centerTitle: true,
        title: Container(
          // height: 40,
          // color: primaryColor,
          child: Text(
            'PELETERIA VALAMY',
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.person, color: primaryColor, size: 26),
            label: Text(
              'Crear Cuenta',
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            height > 760
                ? SizedBox(
                  // color: Colors.amber,
                  height: height * 0.40,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          'assets/images/sign_in_image_mobile.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(color: transparentBlue),
                      SizedBox(
                        // color: Colors.lime,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       alignment: Alignment.centerLeft,
                            //       margin: EdgeInsets.symmetric(vertical: 20),
                            //       padding: EdgeInsets.only(left: 8),
                            //       width: 200,
                            //       height: 42,
                            //       decoration: BoxDecoration(
                            //         color: whiteColor,
                            //         borderRadius: BorderRadius.only(
                            //           topRight: Radius.circular(50),
                            //           bottomRight: Radius.circular(50),
                            //         ),
                            //       ),
                            //       child: Text(
                            //         'PELETERIA VALAMY',
                            //         style: TextStyle(
                            //           color: primaryColor,
                            //           fontSize: 18,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       margin: EdgeInsets.only(right: 20),
                            //       height: 50,
                            //       width: 180,
                            //       child: ElevatedButton(
                            //         onPressed: () {},
                            //         style: ElevatedButton.styleFrom(
                            //           backgroundColor: whiteColor,
                            //         ),
                            //         child: Text(
                            //           'Crear Cuenta',
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //             color: primaryColor,
                            //             fontSize: 16,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                // color: Colors.cyan,
                                // width: double.infinity,
                                child: Image.asset(
                                  'assets/images/sign_in_photo_3_wh_mobile.webp',
                                  // fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   // color: Colors.green,
                            //   margin: EdgeInsets.only(bottom: 10),
                            //   child: Text(
                            //     'Exclusividad y Sofisticación',
                            //     style: TextStyle(
                            //       color: whiteColor,
                            //       fontSize: 20,
                            //       // fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                : Container(),
            SizedBox(
              height: height > 760 ? height * 0.60 : height,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SignInTitleMobile(),
                    SizedBox(height: h_16 / 2),
                    SignInSubtitleMobile(),
                    SizedBox(height: 30),
                    SignInFormMobile(formKey: formKey),
                    SizedBox(height: 16),
                    ForgotPassTextButtonMobile(),
                    // SizedBox(height: height > 700 ? height * 0.1 : h_16),
                    // SizedBox(height: 16),
                    Spacer(),
                    SignInButtonMobile(),
                    SizedBox(height: 16),
                    DontAccountLabelMobile(),
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
