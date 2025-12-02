import 'package:flutter/material.dart';
import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/presentation/screens/auth/sign_in/sign_in_mobile_screen.dart';
import 'package:bee_viajes_turismo/presentation/screens/auth/sign_in/sign_in_tablet_screen.dart';

class SignInScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData apptheme = Theme.of(context);
    // final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xl &&
              constraints.maxWidth > ScreenSizes.lg) {
            return SignInTabletScreen(
              maxHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
              appTheme: apptheme,
              formKey: _formKey,
            );
          } else {
            return SignInMobileScreen(
              maxHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
              appTheme: apptheme,
              formKey: _formKey,
            );
          }
        },
      ),
    );
  }
}
