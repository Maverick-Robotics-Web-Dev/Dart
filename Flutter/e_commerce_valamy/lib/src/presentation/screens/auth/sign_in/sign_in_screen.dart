import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/login_img.jpg', fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Peleteria Valamy',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: defaultPadding / 2),
                    Text(
                      // "Log in with your data that you intered during your registration.",
                      'Inicia sesión con tus datos que ingresaste durante tu registro',
                    ),
                    SizedBox(height: defaultPadding),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
