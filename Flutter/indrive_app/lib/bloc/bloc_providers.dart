import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_blocevent.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_bloc.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_blocevent.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<SignInBloc>(
    create: (context) => SignInBloc()..add(SignInInitEvent()),
  ),
  BlocProvider<SignUpBloc>(
    create: (context) => SignUpBloc()..add(SignUpInitEvent()),
  ),
  // Add other BlocProviders here as needed
];
