// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/payment_bloc.dart' as _i8;
import 'domain/i_api_repository.dart' as _i4;
import 'domain/i_kevin_repository.dart' as _i6;
import 'infrastructure/api_repository.dart' as _i5;
import 'infrastructure/kevin_repository.dart' as _i7;
import 'injectable_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Dio>(() => injectableModule.dio);
  gh.lazySingleton<_i4.IApiRepository>(() => _i5.ApiRepository(get<_i3.Dio>()));
  gh.lazySingleton<_i6.IKevinRepository>(() => _i7.KevinRepository());
  gh.lazySingleton<_i8.PaymentBloc>(() =>
      _i8.PaymentBloc(get<_i4.IApiRepository>(), get<_i6.IKevinRepository>()));
  return get;
}

class _$InjectableModule extends _i9.InjectableModule {}
