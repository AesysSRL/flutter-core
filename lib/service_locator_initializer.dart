import 'package:clean_architecture_core/clean_architecture_core.dart';
import 'package:clean_architecture_core/router/navigator_service.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

import 'error_mapping/app_error.dart';

void registerDependencies(
    AppErrorDelegate errorDefaultMessages,
    VoidCallback dependencies
    ) {
  dependencies();
  getIt
    ..registerLazySingleton<NavigatorService>(() => NavigatorService())
    ..registerLazySingleton<Connectivity>(() => Connectivity())
    ..registerLazySingleton<AppErrorDelegate>(() => errorDefaultMessages);
}
