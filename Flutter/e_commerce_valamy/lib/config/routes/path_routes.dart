import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/security/verification_code_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_setup_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/main/main_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  mainScreenRoute: (BuildContext context) => MainScreen(),
  signInScreenRoute: (BuildContext context) => SignInScreen(),
  signUpScreenRoute: (BuildContext context) => SignUpScreen(),
  signUpSetupScreenRoute: (BuildContext context) => SignUpSetupScreen(),
  verificationCodeScreenRoute:
      (BuildContext context) => VerificationCodeScreen(),
  searchScreenRoute: (BuildContext context) => SearchScreen(),
};
