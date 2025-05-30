import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in_response.dart';

abstract class SignInBlocState {}

class SignInInitialState extends SignInBlocState {}

class SignInLoadingState extends SignInBlocState {}

class SignInSuccessState extends SignInBlocState {
  final SignInResponse response;

  SignInSuccessState({required this.response});
}

class SignInFailureState extends SignInBlocState {
  final Failure failure;

  SignInFailureState({required this.failure});
}
