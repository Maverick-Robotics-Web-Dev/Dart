import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/errors.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/data/data_sources/local/shared_pref.dart';
import 'package:ecommerce_app/features/data/data_sources/remote/auth/auth_remote_data_sources.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_up/sign_up_response_model.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_up/sign_up.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  SharedPref sharedPref;

  AuthRepositoryImpl(this.remoteDataSource, this.sharedPref);

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

  @override
  Future<Either<Failure, SignUpResponseModel>> signUp(SignUp signUpData) async {
    try {
      final response = await remoteDataSource.signUp(signUpData);
      return Right(response);
    } on DioServerError catch (e) {
      return Left(DioFailure(errorMessage: e.message));
    } on ServerError catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }

  @override
  Future<void> saveUserSession(SignInResponseModel signInResponse) async {
    sharedPref.save('user', signInResponse.toJson());
  }

  @override
  Future<SignInResponseModel?> getUserSession() async {
    final data = await sharedPref.read('user');

    if (data != null) {
      SignInResponseModel signInResponse = SignInResponseModel.fromJson(data);
      return signInResponse;
    }

    return null;
  }

  @override
  Future<bool> signOut() async {
    return await sharedPref.remove('user');
  }
}
