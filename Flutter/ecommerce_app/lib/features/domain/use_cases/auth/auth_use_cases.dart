import 'package:ecommerce_app/features/domain/use_cases/auth/get_user_session_use_case.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/save_user_session_use_case.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/sign_up_use_case.dart';

class AuthUseCases {
  SignInUseCase signIn;
  SignUpUseCase signUp;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUserSession;

  AuthUseCases({
    required this.signIn,
    required this.signUp,
    required this.saveUserSession,
    required this.getUserSession,
  });
}
