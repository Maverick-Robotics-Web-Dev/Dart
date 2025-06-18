// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/di/app_module.dart' as _i896;
import 'package:ecommerce_app/features/data/data_sources/local/shared_pref.dart'
    as _i649;
import 'package:ecommerce_app/features/data/data_sources/remote/auth/auth_remote_data_sources.dart'
    as _i145;
import 'package:ecommerce_app/features/data/data_sources/remote/user/user_remote_data_source.dart'
    as _i192;
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart'
    as _i639;
import 'package:ecommerce_app/features/domain/repositories/user/user_repository.dart'
    as _i762;
import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart'
    as _i210;
import 'package:ecommerce_app/features/domain/use_cases/users/user_use_cases.dart'
    as _i1029;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i649.SharedPref>(() => appModule.sharedPref);
    gh.factory<_i145.AuthRemoteDataSource>(() => appModule.remoteDataSource);
    gh.factory<_i192.UserRemoteDataSource>(
      () => appModule.userRemoteDataSource,
    );
    gh.factory<_i639.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i762.UserRepository>(() => appModule.userRepository);
    gh.factory<_i210.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i1029.UserUseCases>(() => appModule.userUseCases);
    return this;
  }
}

class _$AppModule extends _i896.AppModule {}
