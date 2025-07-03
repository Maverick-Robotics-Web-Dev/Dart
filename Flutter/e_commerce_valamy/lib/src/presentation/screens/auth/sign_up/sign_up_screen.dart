import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              _backgroundImage(height, width),
              _backgroundOpacity(height, width),
              _bodyScreen(context, textTheme, height),
            ],
          ),
        ),
      ),
    );
  }

  Container _backgroundImage(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sign_up_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _backgroundOpacity(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: transparentWhite),
    );
  }

  Widget _bodyScreen(
    BuildContext context,
    TextTheme textTheme,
    double height,
  ) => Padding(
    padding: EdgeInsets.all(h_16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('¡Comencemos!', style: textTheme.headlineLarge),
        SizedBox(height: h_16 / 2),
        Text(
          'Por favor ingrese sus datos válidos para crear una cuenta.',
          style: textTheme.bodyLarge,
        ),
        SizedBox(height: h_16),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TxtFormFieldCustom(
                hintText: "Nombre",
                svgPath: "assets/icons/Profile.svg",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h_16),
              TxtFormFieldCustom(
                hintText: "Apellido",
                svgPath: "assets/icons/User_circle.svg",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h_16),
              TxtFormFieldCustom(
                hintText: "Celular",
                svgPath: "assets/icons/Call.svg",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h_16),
              TxtFormFieldCustom(
                hintText: "Email",
                svgPath: "assets/icons/Message.svg",
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
        SizedBox(height: h_16),
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "Estoy de acuerdo con los",
                  children: [
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushNamed(
                              //   context,
                              //   termsOfServicesScreenRoute,
                              // );
                            },
                      text: " Terminos de Servicio ",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: "y la política de privacidad"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
