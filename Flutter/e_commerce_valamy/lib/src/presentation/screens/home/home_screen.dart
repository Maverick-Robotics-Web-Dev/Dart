import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/home/home_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/home/home_tablet_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return HomeTabletScreen(textTheme: textTheme);
          } else {
            return HomeMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
