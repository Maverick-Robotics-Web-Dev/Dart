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
                    ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                        ? (Row(
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
                        ))
                        : (Icon(Icons.menu_rounded, color: whiteColor)),
                    Icon(Icons.login, color: whiteColor),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ResponsiveRowColumn(
                layout:
                    ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                        ? ResponsiveRowColumnType.ROW
                        : ResponsiveRowColumnType.COLUMN,
                rowPadding: EdgeInsets.all(10),
                columnPadding: EdgeInsets.all(10),
                rowMainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ProducWidget(
                      width: width,
                      name: 'Gaming Staff',
                      img: 'assets/images/sign_up_image.jpg',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ProducWidget(
                      width: width,
                      name: 'Gaming Staff',
                      img: 'assets/images/sign_up_image.jpg',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ProducWidget(
                      width: width,
                      name: 'Gaming Staff',
                      img: 'assets/images/sign_up_image.jpg',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ResponsiveRowColumn(
                layout:
                    ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                        ? ResponsiveRowColumnType.ROW
                        : ResponsiveRowColumnType.COLUMN,
                rowPadding: EdgeInsets.all(10),
                columnPadding: EdgeInsets.all(10),
                rowMainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ProducWidget(
                      width: width,
                      name: 'Gaming Staff',
                      img: 'assets/images/sign_up_image.jpg',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ProducWidget(
                      width: width,
                      name: 'Gaming Staff',
                      img: 'assets/images/sign_up_image.jpg',
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ProducWidget(
                      width: width,
                      name: 'Gaming Staff',
                      img: 'assets/images/sign_up_image.jpg',
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

class ProducWidget extends StatelessWidget {
  final double width;
  final String name;
  final String img;

  const ProducWidget({
    super.key,
    required this.width,
    required this.name,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: ResponsiveBreakpoints.of(context).isMobile ? null : width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img,
              width:
                  ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                      ? width * 0.3
                      : width,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: 5,
              ),
              width:
                  ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                      ? width * 0.3
                      : width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: textResponsiveWhite(context)),
                  SizedBox(height: 5),
                  Text(
                    'Ipsum quisquam enim similique praesentium animi quis fuga est repellendus porro consequatur minus eum.',
                    style: textResponsiveWhite(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
