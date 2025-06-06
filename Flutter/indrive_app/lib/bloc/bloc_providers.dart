import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_blocevent.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_bloc.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_blocevent.dart';
import 'package:indrive_app/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_app/injection.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<SignInBloc>(
    create:
        (context) =>
            SignInBloc(locator<AuthUseCases>())..add(SignInInitEvent()),
  ),
  BlocProvider<SignUpBloc>(
    create:
        (context) =>
            SignUpBloc(locator<AuthUseCases>())..add(SignUpInitEvent()),
  ),
  // Add other BlocProviders here as needed
];
