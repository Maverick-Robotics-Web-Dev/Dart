import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_in/sign_in_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_in/sign_in_tablet_screen.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double paddingTop = MediaQuery.of(context).padding.top;
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    double heightWithoutPadding = height - paddingTop - paddingBottom;

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (ResponsiveBreakpoints.of(context).isMobile) {
              return SignInMobileScreen(
                height: height,
                width: width,
                textTheme: textTheme,
                formKey: _formKey,
              );
            } else if (ResponsiveBreakpoints.of(context).isTablet) {
              print('HEIGHT: $height');
              print('PADDING-TOP: ${paddingTop}');
              print('PADDING-BOTTOM: ${paddingBottom}');
              print('HEIGHT WITHOUT PADDING: $heightWithoutPadding');
              return SignInTabletScreen(height: height, width: width);
            } else if (ResponsiveBreakpoints.of(context).isDesktop) {
              return Center(child: Text('DESKTOP'));
            } else {
              return Center(child: Text('4K'));
            }
          },
        ),
      ),
    );
  }
}
