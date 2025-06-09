import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/errors.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/data/data_sources/remote/auth/auth_remote_data_sources.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, SignInResponseModel>> signIn(SignIn signInData) async {
    try {
      final response = await remoteDataSource.signIn(signInData);
      return Right(response);
    } on DioServerError catch (e) {
      return Left(DioFailure(errorMessage: e.message));
    } on ServerError catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }
}
