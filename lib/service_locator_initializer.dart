import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_core/router/router.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

import 'error_mapping/app_error.dart';

final GetIt getIt = GetIt.instance;

void getItInitialization(Router appRouter, ErrorDefaultMessages errorDefaultMessages, VoidCallback dataSources, VoidCallback repositories, VoidCallback useCases) {
  getIt
    ..registerSingleton<DataConnectionChecker>(DataConnectionChecker(), signalsReady: true)
    ..registerSingleton<FlutterLocalNotificationsPlugin>(FlutterLocalNotificationsPlugin(), signalsReady: true)
    ..registerSingleton<Router>(appRouter, signalsReady: true)
    ..registerSingleton<ErrorDefaultMessages>(errorDefaultMessages, signalsReady: true);

  dataSources();
  repositories();
  useCases();
}