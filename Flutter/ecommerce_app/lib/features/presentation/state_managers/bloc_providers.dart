import 'package:ecommerce_app/features/presentation/state_managers/bloc/sign_in/sign_in_bloc_cubit.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/sign_up/sign_up_bloc_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<SignInBlocCubit>(create: (context) => SignInBlocCubit()),
  BlocProvider<SignUpBlocCubit>(create: (context) => SignUpBlocCubit()),
];
