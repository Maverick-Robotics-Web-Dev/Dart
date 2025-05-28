import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/response_resource.dart';
import 'package:ecommerce_app/core/tools/dynamic_to_string.dart';
import 'package:ecommerce_app/features/data/data_sources/remote/auth/auth_remote_data_sources.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource dataSource = AuthRemoteDataSource();

  @override
  Future<DataState> signIn(SignIn signInData) async {
    try {
      return DataSuccess(await dataSource.signIn(signInData));
    } catch (e) {
      if (e is DioException) {
        return DataFailed(getMessageString(e.response?.data["msg"]));
      } else {
        return DataFailed(e.toString());
      }
    }
  }
}
