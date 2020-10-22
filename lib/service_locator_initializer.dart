import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_core/router/core-router.dart';
import 'package:flutter_core/router/navigator_service.dart';

import 'error_mapping/app_error.dart';

void getItInitialization(CoreRouter appRouter, AppErrorDelegate errorDefaultMessages, VoidCallback dataSources, VoidCallback repositories, VoidCallback useCases) {
  dataSources();
  repositories();
  useCases();
  getIt
    ..registerSingleton<NavigatorService>(NavigatorService())
    ..registerSingleton<Connectivity>(Connectivity())
    ..registerSingleton<CoreRouter>(appRouter)
    ..registerSingleton<AppErrorDelegate>(errorDefaultMessages);
}