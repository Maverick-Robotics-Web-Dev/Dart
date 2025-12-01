import 'package:flutter/material.dart';
import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: signInScreenRoute,
  routes: [
    GoRoute(
      // name: 'main_screen',
      path: mainScreenRoute,
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: signInScreenRoute,
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: signUpScreenRoute,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: signUpSetupScreenRoute,
      builder: (context, state) => SignUpSetupScreen(),
    ),
    GoRoute(
      path: verificationCodeScreenRoute,
      builder: (context, state) => VerificationCodeScreen(),
    ),
    GoRoute(
      path: searchScreenRoute,
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(path: homeScreenRoute, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: notificationScreenRoute,
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(
      path: onSaleScreenRoute,
      builder: (context, state) => OnSaleScreen(),
    ),
    GoRoute(path: kidsScreenRoute, builder: (context, state) => KidsScreen()),
    GoRoute(
      name: 'product_screen',
      path: productScreenRoute,
      builder: (context, state) {
        final bool isProductAvailable = state.extra as bool;

        return ProductScreen(isProductAvailable: isProductAvailable);
      },
    ),
    GoRoute(
      path: productBuyNowScreenRoute,
      builder: (context, state) => ProductBuyNowScreen(),
    ),
    GoRoute(
      path: productReviewsScreenRoute,
      builder: (context, state) => ProductReviewsScreen(),
    ),
    GoRoute(
      path: productAddReviewsScreenRoute,
      builder: (context, state) => ProductAddReviewScreen(),
    ),
  ],
);
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

    case kidsScreenRoute:
      return MaterialPageRoute(builder: (context) => KidsScreen());

    case productScreenRoute:
      bool isProductAvailable = settings.arguments as bool? ?? true;
      return MaterialPageRoute(
        builder:
            (context) => ProductScreen(isProductAvailable: isProductAvailable),
      );

    case productBuyNowScreenRoute:
      return MaterialPageRoute(builder: (context) => ProductBuyNowScreen());

    case productReviewsScreenRoute:
      return MaterialPageRoute(builder: (context) => ProductReviewsScreen());

    case productAddReviewsScreenRoute:
      return MaterialPageRoute(builder: (context) => ProductAddReviewScreen());
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
