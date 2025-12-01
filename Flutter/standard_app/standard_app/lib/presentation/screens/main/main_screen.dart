import 'package:flutter/material.dart';
import 'package:standard_app/config/configs.dart';
import 'package:standard_app/presentation/screens/main/main_mobile_screen.dart';
import 'package:standard_app/presentation/screens/main/main_tablet_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData apptheme = Theme.of(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xl &&
              constraints.maxWidth > ScreenSizes.l) {
            return MainTabletScreen(appTheme: apptheme);
          } else {
            return MainMobileScreen(appTheme: apptheme);
          }
        },
      ),
    );
  }
}
