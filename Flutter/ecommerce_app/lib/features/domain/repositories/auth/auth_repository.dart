import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_up/sign_up_response_model.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_up/sign_up.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInResponseModel>> signIn(SignIn signInData);
  Future<Either<Failure, SignUpResponseModel>> signUp(SignUp signUpData);
  Future<void> saveUserSession(SignInResponseModel signInResponse);
  Future<SignInResponseModel?> getUserSession();
}
