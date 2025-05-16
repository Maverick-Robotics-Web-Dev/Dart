import 'package:indrive_app/data/data_source/remote/services/auth_service.dart';
import 'package:indrive_app/domain/repository/auth_repository.dart';
import 'package:indrive_app/domain/models/auth_response_model.dart';
import 'package:indrive_app/domain/utils/response_resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;

  // Constructor injection for AuthService
  AuthRepositoryImpl(this.authService);

  @override
  Future<ResponseResource<AuthResponseModel>> signIn(
    String email,
    String password,
  ) {
    return authService.signIn(email, password);
  }
}
