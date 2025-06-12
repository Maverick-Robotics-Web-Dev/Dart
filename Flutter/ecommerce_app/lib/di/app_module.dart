import 'package:ecommerce_app/features/data/data_sources/local/shared_pref.dart';
import 'package:ecommerce_app/features/data/data_sources/remote/auth/auth_remote_data_sources.dart';
import 'package:ecommerce_app/features/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/get_user_session_use_case.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/save_user_session_use_case.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/sign_up_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthRemoteDataSource get remoteDataSource => AuthRemoteDataSource();

  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(remoteDataSource, sharedPref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    signIn: SignInUseCase(authRepository),
    signUp: SignUpUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
  );
}
