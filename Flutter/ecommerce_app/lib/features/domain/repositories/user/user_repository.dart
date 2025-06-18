import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> update(int id, User user);
}
