// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/di/app_module.dart' as _i3;
import 'package:ecommerce_app/features/data/data_sources/remote/auth/auth_remote_data_sources.dart'
    as _i4;
import 'package:ecommerce_app/features/data/data_sources/local/shared_pref.dart'
    as _i5;
import 'package:ecommerce_app/features/domain/repositories/auth/auth_repository.dart'
    as _i6;
import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i4.AuthRemoteDataSource>(() => appModule.remoteDataSource);
    gh.factory<_i5.SharedPref>(() => appModule.sharedPref);
    gh.factory<_i6.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i7.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i3.AppModule {}
