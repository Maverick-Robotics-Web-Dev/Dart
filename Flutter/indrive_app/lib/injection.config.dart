// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:indrive_app/data/data_source/remote/services/auth_service.dart'
    as _i276;
import 'package:indrive_app/di/app_module.dart' as _i42;
import 'package:indrive_app/domain/repository/auth_repository.dart' as _i974;
import 'package:indrive_app/domain/use_cases/auth/auth_use_cases.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i276.AuthService>(() => appModule.authService);
    gh.factory<_i974.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i116.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i42.AppModule {}
