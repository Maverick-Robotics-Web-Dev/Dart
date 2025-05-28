import 'package:ecommerce_app/core/resources/response_resource.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';

abstract class AuthRepository {
  Future<DataState> signIn(SignIn signInData);
}
