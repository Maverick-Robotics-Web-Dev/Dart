import 'package:indrive_app/data/data_source/remote/services/auth_service.dart';
import 'package:indrive_app/data/repository/auth_repository_impl.dart';
import 'package:indrive_app/domain/repository/auth_repository.dart';
import 'package:indrive_app/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_app/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);

  @injectable
  AuthUseCases get authUseCases =>
      AuthUseCases(signIn: SignInUseCase(authRepository));
}
