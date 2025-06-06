import 'package:ecommerce_app/features/data/data_sources/remote/auth/auth_remote_data_sources.dart';
import 'package:ecommerce_app/features/data/repositories_impl/auth/auth_repository_impl.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthRemoteDataSource get remoteDataSource => AuthRemoteDataSource();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(remoteDataSource);

  @injectable
  AuthUseCases get authUseCases =>
      AuthUseCases(signIn: SignInUseCase(authRepository));
}
