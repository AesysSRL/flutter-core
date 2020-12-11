library flutter_core;

import 'package:flutter/foundation.dart';
import 'package:flutter_core/error_mapping/app_error.dart';
import 'package:flutter_core/router/core-router.dart';
import 'package:flutter_core/service_locator_initializer.dart';
import 'package:get_it/get_it.dart';

export 'package:flutter_core/clean/data_source.dart';
export 'package:flutter_core/clean/entity.dart';
export 'package:flutter_core/clean/repository.dart';
export 'package:flutter_core/clean/use_case.dart';
export 'package:flutter_core/error_mapping/network_exception.dart';
export 'package:flutter_core/http_client/authorization_interceptor.dart';
export 'package:flutter_core/http_client/dio_factory.dart';
export 'package:flutter_core/notification/firebase_messaging_configure.dart';
export 'package:flutter_core/router/core-router.dart';
export 'package:flutter_core/router/navigator_service.dart';
export 'package:flutter_core/utilities/catch_and_map_exception.dart';
export 'package:flutter_core/utilities/disable_glow_scroll_behavior.dart';
export 'package:flutter_core/utilities/extension.dart';
export 'package:flutter_core/utilities/response_wrapper/response_wrapper.dart';
export 'package:flutter_core/utilities/response_wrapper/serializable.dart';

GetIt getIt = GetIt.I;

class Core {
  @Deprecated('Use init')
  static void initialize(
      CoreRouter appRouter,
      AppErrorDelegate appErrorDelegate,
      VoidCallback dataSources,
      VoidCallback repositories,
      VoidCallback useCases) {
    registerDependencies(appRouter, appErrorDelegate, () {
      dataSources();
      repositories();
      useCases();
    });
  }

  static void init(
    CoreRouter appRouter,
    AppErrorDelegate appErrorDelegate,
    VoidCallback dependencies,
  ) {
    registerDependencies(appRouter, appErrorDelegate, dependencies);
  }
}
