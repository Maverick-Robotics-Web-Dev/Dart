import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class GetUserSessionUseCase {
  AuthRepository repository;

  GetUserSessionUseCase(this.repository);

  Future<SignInResponseModel?> call() => repository.getUserSession();
}
