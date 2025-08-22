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
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   // color: Colors.amber,
            //   alignment: Alignment.center,
            //   height: maxHeight * 0.10,
            //   // margin: EdgeInsets.only(bottom: 8),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset('assets/images/logo_valamy_bl.webp', height: 48),
            //       SizedBox(width: 10),
            //       Text(
            //         'PELETERIA VALAMY',
            //         style: TextStyle(
            //           color: primaryColor,
            //           fontSize: 28,
            //           letterSpacing: 1,
            //           // fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   // color: Colors.blue,
            //   height: maxHeight * 0.35,
            //   // margin: EdgeInsets.symmetric(vertical: 10),
            //   width: double.infinity,
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: Image.asset(
            //           'assets/images/sign_in_photo_3_bl.webp',
            //           // fit: BoxFit.fill,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   // color: Colors.purple,
            //   height: maxHeight * 0.55,
            //   // padding: EdgeInsets.only(bottom: 16),
            //   child: Padding(
            //     padding: EdgeInsets.all(20),
            //     child: Column(
            //       children: [
            //         Text(
            //           '¡Bienvenido de Nuevo!',
            //           style: TextStyle(
            //             color: primaryColor,
            //             fontSize: 32,
            //             letterSpacing: 1,
            //           ),
            //         ),
            //         SizedBox(height: 8),
            //         Text(
            //           // "Log in with your data that you intered during your registration.",
            //           'Inicia sesión con tus datos que ingresaste durante tu registro',
            //           style: TextStyle(
            //             color: textColor,
            //             fontSize: 16,
            //             letterSpacing: 1,
            //           ),
            //         ),
            //         SizedBox(height: 16),
            //         Form(
            //           key: formKey,
            //           child: Column(
            //             children: [
            //               TxtFormFieldCustom(
            //                 svgPath: "assets/icons/Message.svg",
            //                 hintText: "Email",
            //                 keyboardType: TextInputType.emailAddress,
            //               ),
            //               SizedBox(height: 16),
            //               TxtFormFieldCustom(
            //                 svgPath: "assets/icons/Lock.svg",
            //                 hintText: "Password",
            //                 obscureText: true,
            //               ),
            //             ],
            //           ),
            //         ),
            //         TextButton(
            //           onPressed: () {},
            //           child: Text(
            //             '¿Olvidaste tu contraseña?',
            //             style: TextStyle(fontSize: font_16_6, letterSpacing: 1),
            //           ),
            //         ),
            //         Spacer(),
            //         ElevatedButton(
            //           onPressed: () {},
            //           style: ElevatedButton.styleFrom(
            //             minimumSize: Size(double.infinity, 32),
            //           ),
            //           child: Text(
            //             'Iniciar Sesión',
            //             style: TextStyle(
            //               fontSize: font_16_6,
            //               // fontWeight: FontWeight.bold,
            //               letterSpacing: 1,
            //             ),
            //           ),
            //         ),
            //         SizedBox(height: 4),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               '¿No tienes una cuenta?',
            //               style: TextStyle(
            //                 color: textColor,
            //                 fontSize: font_16_6,
            //                 fontWeight: FontWeight.w500,
            //                 letterSpacing: 1,
            //               ),
            //             ),
            //             TextButton(
            //               onPressed: () {},
            //               child: Text(
            //                 'Registrate',
            //                 style: TextStyle(
            //                   fontSize: font_16_6,
            //                   fontWeight: FontWeight.w500,
            //                   letterSpacing: 1,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            //********************* OTHER COLOR ***********************************/
            Container(
              // color: Colors.amber,
              alignment: Alignment.center,
              height: maxHeight * 0.10,
              // margin: EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo_valamy_wh.webp', height: 48),
                  SizedBox(width: 10),
                  Text(
                    'PELETERIA VALAMY',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 28,
                      letterSpacing: 1,
                      // fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.blue,
              height: maxHeight * 0.35,
              // margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/sign_in_photo_3_wh.webp',
                      // fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.purple,
              height: maxHeight * 0.55,
              // padding: EdgeInsets.only(bottom: 16),
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
                          fontSize: font_16_6,
                          letterSpacing: 1,
                          color: whiteColor,
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
                          // fontWeight: FontWeight.bold,
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
            ),
          ],
        ),
      ),
    );
  }
}
