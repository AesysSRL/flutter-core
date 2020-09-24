import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_core/router/core-router.dart';
import 'package:get_it/get_it.dart';

import 'error_mapping/app_error.dart';

final GetIt getIt = GetIt.instance;

void getItInitialization(CoreRouter appRouter, ErrorDefaultMessages errorDefaultMessages, VoidCallback dataSources, VoidCallback repositories, VoidCallback useCases) {
  getIt
    ..registerSingleton<Connectivity>(Connectivity(), signalsReady: true)
    ..registerSingleton<CoreRouter>(appRouter, signalsReady: true)
    ..registerSingleton<ErrorDefaultMessages>(errorDefaultMessages, signalsReady: true);

  dataSources();
  repositories();
  useCases();
}