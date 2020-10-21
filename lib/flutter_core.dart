library flutter_core;

import 'package:flutter/foundation.dart';
import 'package:flutter_core/error_mapping/app_error.dart';
import 'package:flutter_core/router/core-router.dart';
import 'package:flutter_core/service_locator_initializer.dart';
import 'package:get_it/get_it.dart';

GetIt getIt;

class Core {
  static void initialize(
      GetIt getItInstance,
      CoreRouter appRouter,
      AppErrorDelegate appErrorDelegate,
      VoidCallback dataSources,
      VoidCallback repositories,
      VoidCallback useCases
      ){
    getIt = getItInstance;
    getItInitialization(appRouter, appErrorDelegate, dataSources, repositories, useCases);
  }

}
