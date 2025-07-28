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
      child: SizedBox(
        height: widget.isKeyboardVisible ? widget.height : widget.maxHeight,
        width: widget.width,
        // decoration: BoxDecoration(color: primaryColor),
        child: Stack(
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
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(13, 71, 161, 0.4),
              ),
            ),
            Row(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: widget.width * 0.6,
                  // margin: EdgeInsets.all(76),
                  padding: EdgeInsets.symmetric(horizontal: 140),
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    // color: Color.fromRGBO(8, 41, 108, 0.2),
                    // color: Color.fromRGBO(255, 255, 255, 1),
                    // border: Border.all(color: primaryColor),
                    // borderRadius: BorderRadius.circular(20),
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
                Container(
                  width: widget.width * 0.4,
                  child: Stack(
                    alignment: Alignment.center,
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
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(color: transparentWhite),
                      // ),

                      // Container(
                      //   height: 200,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     // color: Color.fromRGBO(255, 255, 255, 0.7),
                      //     color: Color.fromRGBO(8, 41, 108, 1),
                      //     borderRadius: BorderRadius.only(
                      //       topRight: Radius.circular(20),
                      //       bottomRight: Radius.circular(20),
                      //     ),
                      //   ),
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/logo_valamy_blanco.png',
                            width: 260,
                            height: 260,
                          ),
                          // SvgPicture.asset(
                          //   'assets/images/logo_valamy.svg',
                          //   width: 200,
                          //   height: 200,
                          //   colorFilter: ColorFilter.mode(
                          //     primaryColor,
                          //     BlendMode.srcIn,
                          //   ),
                          // ),
                          Text(
                            'Peleteria Valamy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              letterSpacing: 1,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Exclusividad y Sofisticación',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
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
