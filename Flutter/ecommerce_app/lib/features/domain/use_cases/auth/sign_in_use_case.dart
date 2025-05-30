import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in_response.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class SignInUseCase {
  AuthRepository repository = AuthRepositoryImpl();

  Future<Either<Failure, SignInResponse>> call(SignIn signInData) =>
      repository.signIn(signInData);
}
