import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_event.dart';
import 'package:ecommerce_app/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
];
