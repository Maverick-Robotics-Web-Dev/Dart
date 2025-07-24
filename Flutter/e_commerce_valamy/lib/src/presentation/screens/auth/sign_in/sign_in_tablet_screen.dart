import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInTabletScreen extends StatefulWidget {
  final double? height;
  final double? width;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;
  final bool isKeyboardVisible;

  const SignInTabletScreen({
    super.key,
    this.height,
    this.width,
    this.textTheme,
    this.formKey,
    required this.isKeyboardVisible,
  });

  @override
  State<SignInTabletScreen> createState() => _SignInTabletScreenState();
}

class _SignInTabletScreenState extends State<SignInTabletScreen> {
  @override
  Widget build(BuildContext context) {
    print('Keyboard visible: ${widget.isKeyboardVisible}');
    return SingleChildScrollView(
      child: Container(
        height:
            widget.isKeyboardVisible
                ? MediaQuery.of(context).size.height
                : widget.height,
        width: widget.width,
        decoration: BoxDecoration(color: primaryColor),
        child: Row(
          children: [
            Expanded(
              // flex: 4,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sign_in_image.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
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
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 50,
                  right: 50,
                  bottom: 50,
                  left: 50,
                ),
                padding: EdgeInsets.symmetric(horizontal: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
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
                        color: textColor,
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
                          widget.height != null
                              ? (widget.height! > 700)
                                  ? (widget.height! * 0.1)
                                  : (h_16)
                              : null,
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
                            color: textColor,
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
    );
  }
}
