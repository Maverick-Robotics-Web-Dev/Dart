import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/Security/verification_code_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_setup_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  signInRoute: (BuildContext context) => SignInScreen(),
  signUpRoute: (BuildContext context) => SignUpScreen(),
  signUpSetupRoute: (BuildContext context) => SignUpSetupScreen(),
  verificationCodeRoute: (BuildContext context) => VerificationCodeScreen(),
};
