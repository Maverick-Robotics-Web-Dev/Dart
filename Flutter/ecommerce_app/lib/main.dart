import 'package:ecommerce_app/features/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/features/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc_providers.dart';
import 'package:ecommerce_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: 'sign_in',
        routes: {
          'sign_in': (BuildContext context) => SignInScreen(),
          'sign_up': (BuildContext context) => SignUpScreen(),
        },
      ),
    );
  }
}
