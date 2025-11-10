import 'package:e_commerce_valamy/config/routes/path_routes.dart';
import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Valamy',
      theme: lightTheme(context),
      // themeMode: ThemeMode.light,
      initialRoute: mainScreenRoute,
      routes: routes,
    );
  }
}
