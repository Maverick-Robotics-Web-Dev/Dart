import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/security/verification_code_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_setup_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/home/home_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/main/main_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/notification/notification_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/on_sale/on_sale_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

// Map<String, Widget Function(BuildContext)> routes = {
//   mainScreenRoute: (BuildContext context) => MainScreen(),
//   signInScreenRoute: (BuildContext context) => SignInScreen(),
//   signUpScreenRoute: (BuildContext context) => SignUpScreen(),
//   signUpSetupScreenRoute: (BuildContext context) => SignUpSetupScreen(),
//   verificationCodeScreenRoute:
//       (BuildContext context) => VerificationCodeScreen(),
//   searchScreenRoute: (BuildContext context) => SearchScreen(),
// };

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case mainScreenRoute:
      return MaterialPageRoute(builder: (context) => MainScreen());
    case signInScreenRoute:
      return MaterialPageRoute(builder: (context) => SignInScreen());
    case signUpScreenRoute:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case signUpSetupScreenRoute:
      return MaterialPageRoute(builder: (context) => SignUpSetupScreen());
    case verificationCodeScreenRoute:
      return MaterialPageRoute(builder: (context) => VerificationCodeScreen());
    case searchScreenRoute:
      return MaterialPageRoute(builder: (context) => SearchScreen());
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case notificationScreenRoute:
      return MaterialPageRoute(builder: (context) => NotificationScreen());
    case onSaleScreenRoute:
      return MaterialPageRoute(builder: (context) => OnSaleScreen());
    default:
      return MaterialPageRoute(
        builder:
            (context) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ),
      );
  }
}
