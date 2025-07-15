import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              // Column(children: [_bodyScreen(context, textTheme, height)]),
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
          image: AssetImage('assets/images/sign_in_image.jpg'),
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

  // Widget _headerScreen() =>
  //     Image.asset('assets/images/login_img.jpg', fit: BoxFit.cover);

  Widget _bodyScreen(
    BuildContext context,
    TextTheme textTheme,
    double height,
  ) => Padding(
    padding: EdgeInsets.all(h_16),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Peleteria Valamy', style: textTheme.headlineLarge),
        SizedBox(height: h_16 / 2),
        Text(
          // "Log in with your data that you intered during your registration.",
          'Inicia sesión con tus datos que ingresaste durante tu registro',
          style: textTheme.bodyLarge,
        ),
        SizedBox(height: h_16),
        Form(
          key: _formKey,
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
        Align(
          child: TextButton(
            onPressed: () {},
            child: Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(fontSize: font_16, letterSpacing: 1),
            ),
          ),
        ),
        SizedBox(height: height > 700 ? height * 0.1 : h_16),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¿No tienes una cuenta?',
              style: TextStyle(
                color: textColor,
                fontSize: font_16,
                // fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: font_16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
