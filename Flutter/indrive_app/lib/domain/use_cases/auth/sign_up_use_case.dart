import 'package:indrive_app/domain/models/user_model.dart';
import 'package:indrive_app/domain/repository/auth_repository.dart';

class SignUpUseCase {
  AuthRepository repository;

  SignUpUseCase(this.repository);

  run(UserModel userModel) => repository.signUp(userModel);
}
