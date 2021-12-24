// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../clean_architecture_core.dart' as _i4;
import 'injector_configuration.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initInjector(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final externalLibraries = _$ExternalLibraries();
  gh.factory<_i3.Connectivity>(() => externalLibraries.cbor);
  gh.factory<_i4.DateFormat>(() => externalLibraries.dateFormat);
  await gh.factoryAsync<_i4.SharedPreferences>(() => externalLibraries.prefs, preResolve: true);
  return get;
}

class _$ExternalLibraries extends _i5.ExternalLibraries {}
