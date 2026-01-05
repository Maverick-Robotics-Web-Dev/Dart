import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter/material.dart';

import 'check_auth_status_mobile_screen.dart';
import 'check_auth_status_tablet_screen.dart';

class CheckAuthStatusScreen extends StatelessWidget {
  const CheckAuthStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData apptheme = Theme.of(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xl &&
              constraints.maxWidth > ScreenSizes.lg) {
            return CheckAuthStatusTabletScreen(appTheme: apptheme);
          } else {
            return CheckAuthStatusMobileScreen(appTheme: apptheme);
          }
        },
      ),
    );
  }
}
