import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_up/sign_up.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_up/sign_up_response.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class SignUpUseCase {
  AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, SignUpResponse>> call(SignUp signUpData) =>
      repository.signUp(signUpData);
}
