import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_core/router/core-router.dart';
import 'package:get_it/get_it.dart';

import 'error_mapping/app_error.dart';

final GetIt getIt = GetIt.instance;

Future<void> getItInitialization(CoreRouter appRouter, AppErrorDelegate errorDefaultMessages, VoidCallback dataSources, VoidCallback repositories, VoidCallback useCases) {
  dataSources();
  repositories();
  useCases();
  getIt
    ..registerSingleton<Connectivity>(Connectivity(), signalsReady: true)
    ..registerSingleton<CoreRouter>(appRouter, signalsReady: true)
    ..registerSingleton<AppErrorDelegate>(errorDefaultMessages, signalsReady: true);
  return getIt.allReady();
}