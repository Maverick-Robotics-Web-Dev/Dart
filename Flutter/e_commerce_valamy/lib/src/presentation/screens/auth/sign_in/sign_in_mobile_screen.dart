import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInMobileScreen extends StatelessWidget {
  final double? height;
  final double? width;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInMobileScreen({
    super.key,
    this.height,
    this.width,
    this.textTheme,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/sign_in_image_mobile.jpg',
            fit: BoxFit.cover,
          ),
          // Container(
          //   height: height,
          //   width: width,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/sign_in_image.jpg'),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          // Container(
          //   height: height,
          //   width: width,
          //   decoration: BoxDecoration(color: transparentWhite),
          // ),
          Padding(
            padding: const EdgeInsets.all(h_16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Peleteria Valamy',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 32,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: h_16 / 2),
                Text(
                  // "Log in with your data that you intered during your registration.",
                  'Inicia sesión con tus datos que ingresaste durante tu registro',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    letterSpacing: 1,
                    // fontWeight: FontWeight.w500,
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
                      SizedBox(height: h_16),
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
                      style: TextStyle(fontSize: font_16_6, letterSpacing: 1),
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
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: font_16_6,
                      // fontWeight: FontWeight.bold,
                      letterSpacing: 1,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
