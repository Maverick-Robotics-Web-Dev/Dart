import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/presentation/screens/auth/sign_up/sign_up_mobile_screen.dart';
import 'package:bee_viajes_turismo/presentation/screens/auth/sign_up/sign_up_tablet_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData apptheme = Theme.of(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xl &&
              constraints.maxWidth > ScreenSizes.lg) {
            return SignUpTabletScreen(appTheme: apptheme, formKey: _formKey);
          } else {
            return SignUpMobileScreen(appTheme: apptheme, formKey: _formKey);
          }
        },
      ),
    );
  }
}
