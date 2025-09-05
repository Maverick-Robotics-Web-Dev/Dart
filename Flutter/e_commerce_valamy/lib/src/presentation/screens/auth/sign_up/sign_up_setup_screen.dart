import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_setup_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_setup_tablet_screen.dart';
import 'package:flutter/material.dart';

class SignUpSetupScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    // double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return SignUpSetupTabletScreen(
              maxHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
              textTheme: textTheme,
              formKey: _formKey,
            );
          } else {
            return SignUpSetupMobileScreen(
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
