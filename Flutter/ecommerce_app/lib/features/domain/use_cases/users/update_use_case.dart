import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';
import 'package:ecommerce_app/features/domain/repositories/user/user_repository.dart';

class UpdateUseCase {
  UserRepository repository;

  UpdateUseCase(this.repository);

  Future<Either<Failure, User>> call(int id, User user) =>
      repository.update(id, user);
}
