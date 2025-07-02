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

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerScreen(),
              _bodyScreen(context, textTheme, height),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerScreen() =>
      Image.asset('assets/images/login_img.jpg', fit: BoxFit.cover);

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
        Text('Peleteria Valamy', style: textTheme.headlineSmall),
        SizedBox(height: h_16),
        Text(
          // "Log in with your data that you intered during your registration.",
          'Inicia sesión con tus datos que ingresaste durante tu registro',
          style: textTheme.bodyMedium,
        ),
        SizedBox(height: h_24),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TxtFormFieldCustom(
                svgPath: "assets/icons/Message.svg",
                hintText: "Email address",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h_24),
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
              style: TextStyle(fontSize: 14.6),
            ),
          ),
        ),
        SizedBox(height: height > 700 ? height * 0.1 : h_16),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Sign in',
            style: TextStyle(fontSize: 14.6, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¿No tienes una cuenta?', style: TextStyle(fontSize: 14.6)),
            TextButton(
              onPressed: () {},
              child: Text('Sign Up', style: TextStyle(fontSize: 14.6)),
            ),
          ],
        ),
      ],
    ),
  );
}
