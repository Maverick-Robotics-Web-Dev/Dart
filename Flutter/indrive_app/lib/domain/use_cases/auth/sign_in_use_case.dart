import 'package:indrive_app/domain/repository/auth_repository.dart';

class SignInUseCase {
  AuthRepository repository;

  SignInUseCase(this.repository);

  run(String email, String password) => repository.signIn(email, password);
}
