import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_in/sign_in_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_in/sign_in_tablet_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1920) {
              return Center(child: Text('4K'));
            } else if (constraints.maxWidth <= 1920 &&
                constraints.maxWidth > 1280) {
              return Center(child: Text('DESKTOP'));
            } else if (constraints.maxWidth <= 1280 &&
                constraints.maxWidth > 450) {
              return SignInTabletScreen(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                textTheme: textTheme,
                formKey: _formKey,
                isKeyboardVisible: isKeyboardVisible,
              );
            } else {
              return SignInMobileScreen(
                height: height,
                width: width,
                textTheme: textTheme,
                formKey: _formKey,
              );
            }
          },
        ),
      ),
    );
  }
}
