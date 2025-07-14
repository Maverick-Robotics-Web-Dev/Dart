import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/config/theme/responsive_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                width: width,
                height: 56,
                color: primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResponsiveBreakpoints.of(context).largerThan(TABLET)
                        ? Row(
                          children: [
                            Text(
                              'Products',
                              style: textResponsiveWhite(context),
                            ),
                            SizedBox(width: width * 0.02),
                            Text('Cart', style: textResponsiveWhite(context)),
                            SizedBox(width: width * 0.02),
                            Text(
                              'About Me',
                              style: textResponsiveWhite(context),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              'Favorite',
                              style: textResponsiveWhite(context),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              'Settings',
                              style: textResponsiveWhite(context),
                            ),
                          ],
                        )
                        : Icon(Icons.menu_rounded, color: whiteColor),
                    Icon(Icons.login, color: whiteColor),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ResponsiveRowColumn(
                layout:
                    ResponsiveBreakpoints.of(context).largerThan(TABLET)
                        ? ResponsiveRowColumnType.ROW
                        : ResponsiveRowColumnType.COLUMN,
                children: [
                  ResponsiveRowColumnItem(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/sign_up_image.jpg',
                          width: width * 0.3,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: width * 0.3,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
