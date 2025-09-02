import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:flutter/material.dart';

class LayoutResponsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const LayoutResponsive({
    super.key,
    required this.mobile,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= ScreenSizes.xLarge &&
            constraints.maxWidth > ScreenSizes.large) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
