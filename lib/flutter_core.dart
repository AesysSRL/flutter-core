library flutter_core;

import 'package:flutter/foundation.dart';
import 'package:flutter_core/error_mapping/app_error.dart';
import 'package:flutter_core/router/router.dart';
import 'package:flutter_core/service_locator_initializer.dart';

class Core {
  static void initialize(
      Router appRouter,
      ErrorDefaultMessages errorDefaultMessages,
      VoidCallback dataSources,
      VoidCallback repositories,
      VoidCallback useCases
      ){
    getItInitialization(appRouter, errorDefaultMessages, dataSources, repositories, useCases);
  }

}
