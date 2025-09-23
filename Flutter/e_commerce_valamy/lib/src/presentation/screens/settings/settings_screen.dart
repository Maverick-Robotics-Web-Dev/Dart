import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/settings/settings_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/settings/settings_tablet_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return SettingsTabletScreen(textTheme: textTheme);
          } else {
            return SettingsMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
