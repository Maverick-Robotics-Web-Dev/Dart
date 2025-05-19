import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_blocstate.dart';
import 'package:indrive_app/domain/utils/response_resource.dart';
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
        resizeToAvoidBottomInset: false,
        body: BlocListener<SignInBloc, SignInBlocState>(
          listener: (context, state) {
            final response = state.response;
            if (response is ErrorData) {
              Fluttertoast.showToast(
                msg: response.data,
                toastLength: Toast.LENGTH_SHORT,
              );
              print('Error: ${response.data}');
            } else if (response is SuccessData) {
              print('Success: ${response.data}');
            }
          },
          child: BlocBuilder<SignInBloc, SignInBlocState>(
            builder: (context, state) {
              final response = state.response;
              if (response is LoadingData) {
                return Stack(
                  children: [
                    SignInBody(signInBlocState: state),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }
              return SignInBody(signInBlocState: state);
            },
          ),
        ),
      ),
    );
  }
}
