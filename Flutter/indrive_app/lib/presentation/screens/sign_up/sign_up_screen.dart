import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_bloc.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_blocevent.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_blocstate.dart';
import 'package:indrive_app/domain/utils/response_resource.dart';
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
        body: BlocListener<SignUpBloc, SignUpBlocState>(
          listener: (context, state) {
            final response = state.response;
            if (response is ErrorData) {
              Fluttertoast.showToast(
                msg: response.data,
                toastLength: Toast.LENGTH_LONG,
              );
            } else if (response is SuccessData) {
              context.read<SignUpBloc>().add(FormResetEvent());
            }
          },
          child: BlocBuilder<SignUpBloc, SignUpBlocState>(
            builder: (context, state) {
              return SignUpBody(signUpBlocState: state);
            },
          ),
        ),
      ),
    );
  }
}
