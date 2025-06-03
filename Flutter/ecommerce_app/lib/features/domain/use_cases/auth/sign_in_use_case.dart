import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in_response.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class SignInUseCase {
  AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, SignInResponse>> call(SignIn signInData) =>
      repository.signIn(signInData);
}
