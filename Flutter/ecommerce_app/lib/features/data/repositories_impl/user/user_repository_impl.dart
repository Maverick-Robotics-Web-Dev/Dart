import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/errors.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/data/data_sources/remote/user/user_remote_data_source.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';
import 'package:ecommerce_app/features/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> update(String id, User user) async {
    try {
      final response = await remoteDataSource.update(id, user);
      return Right(response);
    } on DioServerError catch (e) {
      return Left(DioFailure(errorMessage: e.message));
    } on ServerError catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }
}
