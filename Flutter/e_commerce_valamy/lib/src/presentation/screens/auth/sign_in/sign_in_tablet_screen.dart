import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInTabletScreen extends StatefulWidget {
  final double height;
  final double width;
  final double maxWidth;
  final double maxHeight;
  final bool isKeyboardVisible;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInTabletScreen({
    super.key,
    required this.height,
    required this.width,
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
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sign_in_image.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              // color: Color.fromRGBO(255, 255, 255, 0.7),
              color: const Color.fromRGBO(248, 248, 249, 0.8),
              // color: Color.fromRGBO(8, 41, 108, 0.46),
            ),
          ),
          Container(
            height: widget.isKeyboardVisible ? widget.height : widget.maxHeight,
            width: widget.width,
            // decoration: BoxDecoration(color: primaryColor),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: AssetImage('assets/images/sign_in_image.jpg'),
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(255, 255, 255, 0.7),
                          color: Color.fromRGBO(8, 41, 108, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Peleteria Valamy',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 48,
                                letterSpacing: 1,
                                // fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Exclusividad y Sofisticación',
                              style: TextStyle(
                                color: whiteColor,
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
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: 50,
                      right: 50,
                      bottom: 50,
                      left: 50,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      // color: Color.fromRGBO(8, 41, 108, 0.2),
                      // color: Color.fromRGBO(255, 255, 255, 0.8),
                      // border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text('Sign In', style: textTheme?.headlineLarge),
                        Text(
                          'Sign In',
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
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 40),
                        Form(
                          key: widget.formKey,
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
                        SizedBox(height: 14),
                        Align(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '¿Olvidaste tu contraseña?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              widget.height > 700
                                  ? (widget.height * 0.1)
                                  : (h_16),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 32),
                            backgroundColor: primaryColor,
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¿No tienes una cuenta?',
                              style: TextStyle(
                                color: secondaryColor,
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
                                  color: primaryColor,
                                  fontSize: 18,
                                  // fontWeight: FontWeight.w500,
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
        ],
      ),
    );
  }
}
