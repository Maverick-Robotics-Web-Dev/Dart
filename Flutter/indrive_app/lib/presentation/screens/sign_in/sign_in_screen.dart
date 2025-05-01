import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_blocstate.dart';
import 'package:indrive_app/presentation/screens/sign_in/sign_in_body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SignInBloc, SignInBlocState>(
          builder: (context, state) {
            return SignInBody(signInBlocState: state);
          },
        ),
      ),
    );
  }
}
