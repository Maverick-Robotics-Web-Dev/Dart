import 'package:e_commerce_valamy/config/routes/path_routes.dart';
import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:
          (context, widget) => ResponsiveBreakpoints(
            breakpoints: [
              Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
              Breakpoint(start: 0, end: 450, name: MOBILE),
              Breakpoint(start: 451, end: 800, name: TABLET),
              Breakpoint(start: 801, end: 1920, name: DESKTOP),
              Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
            child: ClampingScrollWrapper.builder(context, widget!),
          ),
      debugShowCheckedModeBanner: false,
      title: 'Valamy',
      theme: lightTheme(context),
      // themeMode: ThemeMode.light,
      initialRoute: verificationCodeRoute,
      routes: routes,
    );
  }
}
