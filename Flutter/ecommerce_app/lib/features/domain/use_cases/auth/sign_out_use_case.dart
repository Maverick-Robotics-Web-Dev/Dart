import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class SignOutUseCase {
  AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<bool> call() => repository.signOut();
}
