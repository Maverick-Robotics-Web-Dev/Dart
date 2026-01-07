import 'package:bee_viajes_turismo/presentation/presentation.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'router_notifier.dart';
import 'routes.dart';

class GoRouterConfig {
  static GoRouter appRouter({BuildContext? context}) {
    late final AuthBloc authBloc;

    if (context != null) {
      authBloc = context.read<AuthBloc>();
    }

    return GoRouter(
      initialLocation: pathSplashScreenRoute,
      refreshListenable: GoRouterNotifier(stream: authBloc.stream),
      redirect: (context, state) {
        final isGoingTo = state.matchedLocation;
        final authStatus = authBloc.state.authStatus;

        if (isGoingTo == pathSplashScreenRoute &&
            authStatus == AuthStatus.checking) {
          return null;
        }
        if (authStatus == AuthStatus.notAuthenticated) {
          if (isGoingTo == pathSignInScreenRoute ||
              isGoingTo == pathSignUpScreenRoute ||
              isGoingTo == pathSignUpSetupScreenRoute) {
            return null;
          }
          return pathSignInScreenRoute;
        }

        if (authStatus == AuthStatus.authenticated) {
          if (isGoingTo == pathSignInScreenRoute ||
              isGoingTo == pathSignUpScreenRoute ||
              isGoingTo == pathSignUpSetupScreenRoute ||
              isGoingTo == pathSplashScreenRoute) {
            return pathMainScreenRoute;
          }
        }

        return null;
      },
      routes: [
        GoRoute(
          name: splashScreenRoute,
          path: pathSplashScreenRoute,
          builder: (context, state) => CheckAuthStatusScreen(),
        ),
        GoRoute(
          name: mainScreenRoute,
          path: pathMainScreenRoute,
          builder: (context, state) => MainScreen(),
        ),
        GoRoute(
          name: signInScreenRoute,
          path: pathSignInScreenRoute,
          builder: (context, state) => SignInScreen(),
        ),
        GoRoute(
          name: signUpScreenRoute,
          path: pathSignUpScreenRoute,
          builder: (context, state) => SignUpScreen(),
        ),
        // GoRoute(
        //   path: pathSignUpSetupScreenRoute,
        //   builder: (context, state) => SignUpSetupScreen(),
        // ),
        // GoRoute(
        //   path: pathVerificationCodeScreenRoute,
        //   builder: (context, state) => VerificationCodeScreen(),
        // ),
        // GoRoute(
        //   path: pathSearchScreenRoute,
        //   builder: (context, state) => SearchScreen(),
        // ),
        // GoRoute(
        //   path: pathHomeScreenRoute,
        //   builder: (context, state) => HomeScreen(),
        // ),
        GoRoute(
          name: notificationScreenRoute,
          path: '$pathNotificationScreenRoute/:messageId',
          builder: (context, state) => NotificationScreen(
            pushMessageId: state.pathParameters['messageId'] ?? '',
          ),
        ),
        // GoRoute(
        //   path: pathOnSaleScreenRoute,
        //   builder: (context, state) => OnSaleScreen(),
        // ),
        // GoRoute(
        //   path: pathKidsScreenRoute,
        //   builder: (context, state) => KidsScreen(),
        // ),
        GoRoute(
          name: productsScreenRoute,
          path: pathProductsScreenRoute,
          builder: (context, state) {
            return ProductsScreen();
          },
        ),
        GoRoute(
          name: productScreenRoute,
          path: '$pathProductScreenRoute/:id',
          builder: (context, state) {
            return ProductScreen(
              productId: state.pathParameters['id'] ?? 'no-id',
            );
          },
        ),
        // GoRoute(
        //   path: pathProductBuyNowScreenRoute,
        //   builder: (context, state) => ProductBuyNowScreen(),
        // ),
        // GoRoute(
        //   path: pathProductReviewsScreenRoute,
        //   builder: (context, state) => ProductReviewsScreen(),
        // ),
        // GoRoute(
        //   path: pathProductAddReviewsScreenRoute,
        //   builder: (context, state) => ProductAddReviewScreen(),
        // ),
      ],
    );
  }
}
