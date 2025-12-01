import 'package:flutter/material.dart';
import 'package:standard_app/config/configs.dart';
import 'package:standard_app/config/routes/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
