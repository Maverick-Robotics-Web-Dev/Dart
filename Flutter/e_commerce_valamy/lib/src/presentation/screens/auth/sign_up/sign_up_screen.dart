import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_tablet_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return SignUpTabletScreen(
              maxHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
              textTheme: textTheme,
              formKey: _formKey,
            );
          } else {
            return SignUpMobileScreen(
              maxHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
              textTheme: textTheme,
              formKey: _formKey,
            );
          }
        },
      ),
    );
  }
}
