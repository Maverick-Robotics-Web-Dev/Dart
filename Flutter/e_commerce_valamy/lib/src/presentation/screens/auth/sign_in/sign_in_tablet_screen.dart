import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInTabletScreen extends StatelessWidget {
  final double? height;
  final double? width;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInTabletScreen({
    super.key,
    this.height,
    this.width,
    this.textTheme,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: primaryColor),
      child: Row(
        children: [
          Expanded(
            // flex: 4,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sign_in_image.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Peleteria Valamy',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 48,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Exclusividad y Sofisticación',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 22,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 3,
            child: Container(
              height: height,
              width: double.infinity,
              // margin: EdgeInsets.only(top: 26, right: 50, bottom: 26),
              padding: EdgeInsets.symmetric(horizontal: 100),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(40),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text('Sign In', style: textTheme?.headlineLarge),
                  Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteColor,
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
                      color: whiteColor,
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 60),
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
                  SizedBox(height: 18),
                  Align(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '¿Olvidaste tu contraseña?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        height != null
                            ? (height! > 700)
                                ? (height! * 0.1)
                                : (h_16)
                            : null,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 32),
                      backgroundColor: whiteColor,
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: font_16_6,
                        // fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes una cuenta?',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18,
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
    );
  }
}
