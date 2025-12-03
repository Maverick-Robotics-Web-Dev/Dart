import 'package:bee_viajes_turismo/config/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(statusBarColor: Colors.blue),
  // );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        // home: Scaffold(body: Center(child: Text('Hello World!'))),
      ),
    );
  }
}
