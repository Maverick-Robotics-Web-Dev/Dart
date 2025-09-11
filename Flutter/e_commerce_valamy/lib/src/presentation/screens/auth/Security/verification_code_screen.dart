import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/security/verification_code_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/security/verification_code_tablet_screen.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return VerificationCodeTabletScreen(
              maxHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
              textTheme: textTheme,
              formKey: _formKey,
            );
          } else {
            return VerificationCodeMobileScreen(
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
