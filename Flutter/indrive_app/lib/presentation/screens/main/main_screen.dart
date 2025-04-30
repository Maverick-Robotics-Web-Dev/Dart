import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_app/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:indrive_app/presentation/screens/sign_up/sign_up_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InDriver Clone',
        initialRoute: 'sign_in',
        routes: {
          'sign_in': (context) => SignInScreen(),
          'sign_up': (context) => SignUpScreen(),
          // Add other routes here
        },
      ),
    );
  }
}
