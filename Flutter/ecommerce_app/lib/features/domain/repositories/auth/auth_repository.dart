import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in_response_model.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInResponseModel>> signIn(SignIn signInData);
}
