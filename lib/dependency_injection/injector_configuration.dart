import 'package:connectivity_plus/connectivity_plus.dart';

import '../clean_architecture_core.dart';
import 'injector_configuration.config.dart';

final injector = GetIt.I;

@InjectableInit(initializerName: r'$initInjector')
Future<void> initInjector() async => $initInjector(injector);

@module
abstract class ExternalLibraries {
  @injectable
  Connectivity get cbor => Connectivity();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
