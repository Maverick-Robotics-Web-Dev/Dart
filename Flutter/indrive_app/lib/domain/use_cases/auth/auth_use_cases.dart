import 'package:indrive_app/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:indrive_app/domain/use_cases/auth/sign_up_use_case.dart';

class AuthUseCases {
  SignInUseCase signIn;
  SignUpUseCase signUp;

  AuthUseCases({required this.signIn, required this.signUp});
}
