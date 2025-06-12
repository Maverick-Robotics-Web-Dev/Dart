import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class SaveUserSessionUseCase {
  AuthRepository repository;

  SaveUserSessionUseCase(this.repository);

  Future<void> call(SignInResponseModel signInResponse) =>
      repository.saveUserSession(signInResponse);
}
