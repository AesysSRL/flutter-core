import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_core/router/core-router.dart';
import 'package:get_it/get_it.dart';

import 'error_mapping/app_error.dart';

void getItInitialization(CoreRouter appRouter, AppErrorDelegate errorDefaultMessages, VoidCallback dataSources, VoidCallback repositories, VoidCallback useCases) {
  dataSources();
  repositories();
  useCases();
  GetIt.I
    ..registerSingleton<Connectivity>(Connectivity())
    ..registerSingleton<CoreRouter>(appRouter)
    ..registerSingleton<AppErrorDelegate>(errorDefaultMessages);
}