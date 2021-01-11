import 'package:clean_architecture_core/clean_architecture_core.dart';
import 'package:clean_architecture_core/router/core_router.dart';
import 'package:clean_architecture_core/router/navigator_service.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

import 'error_mapping/app_error.dart';
void registerDependencies(
    CoreRouter appRouter,
    AppErrorDelegate errorDefaultMessages,
    VoidCallback dependencies
    ) {
  dependencies();
  getIt
    ..registerLazySingleton<NavigatorService>(() => NavigatorService())
    ..registerLazySingleton<Connectivity>(() => Connectivity())
    ..registerLazySingleton<CoreRouter>(() => appRouter)
    ..registerLazySingleton<AppErrorDelegate>(() => errorDefaultMessages);
}
