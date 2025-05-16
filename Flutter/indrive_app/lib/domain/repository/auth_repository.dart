import 'package:indrive_app/domain/models/auth_response_model.dart';
import 'package:indrive_app/domain/utils/response_resource.dart';

abstract class AuthRepository {
  Future<ResponseResource<AuthResponseModel>> signIn(
    String email,
    String password,
  );
}
