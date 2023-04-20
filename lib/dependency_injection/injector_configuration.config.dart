// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture_core/clean_architecture_core.dart' as _i4;
import 'package:clean_architecture_core/dependency_injection/injector_configuration.dart'
    as _i5;
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> $initInjector({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalLibraries = _$ExternalLibraries();
    gh.factory<_i3.Connectivity>(() => externalLibraries.cbor);
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => externalLibraries.prefs,
      preResolve: true,
    );
    return this;
  }
}

class _$ExternalLibraries extends _i5.ExternalLibraries {}
