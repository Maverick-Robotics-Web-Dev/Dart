import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_bloc.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_blocstate.dart';
import 'package:indrive_app/presentation/screens/sign_up/sign_up_body.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SignUpBloc, SignUpBlocState>(
          builder: (context, state) {
            return SignUpBody(signUpBlocState: state);
          },
        ),
      ),
    );
  }
}
