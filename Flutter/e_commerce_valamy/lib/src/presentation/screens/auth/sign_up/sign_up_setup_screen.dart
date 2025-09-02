import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_setup_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/auth/sign_up/sign_up_setup_tablet_screen.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/layout_responsive.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignUpSetupScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: LayoutResponsive(
        tablet: SignUpSetupTabletScreen(),
        mobile: SignUpSetupMobileScreen(),
      ),
    );
  }
}
