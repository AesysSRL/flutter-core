import 'package:connectivity_plus/connectivity_plus.dart';
import '../clean_architecture_core.dart';
import 'injector_configuration.config.dart';
import 'package:injectable/injectable.dart';

final injector = GetIt.I;

@InjectableInit(initializerName: r'$initInjector')
Future<void> initInjector() async => injector.$initInjector();

@module
abstract class ExternalLibraries {
  @injectable
  Connectivity get cbor => Connectivity();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
