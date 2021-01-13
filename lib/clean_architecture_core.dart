library clean_architecture_core;

import 'package:clean_architecture_core/error_mapping/app_error.dart';
import 'package:clean_architecture_core/router/core_router.dart';
import 'package:clean_architecture_core/service_locator_initializer.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

export 'package:clean_architecture_core/clean/core_provider.dart';
export 'package:clean_architecture_core/clean/data_source.dart';
export 'package:clean_architecture_core/clean/entities.dart';
export 'package:clean_architecture_core/clean/repository.dart';
export 'package:clean_architecture_core/clean/use_case.dart';
export 'package:clean_architecture_core/error_mapping/app_error.dart';
export 'package:clean_architecture_core/error_mapping/network_exception.dart';
export 'package:clean_architecture_core/http_client/authorization_interceptor.dart';
export 'package:clean_architecture_core/http_client/dio_factory.dart';
export 'package:clean_architecture_core/response_wrapper/converter.dart';
export 'package:clean_architecture_core/response_wrapper/response_wrapper.dart';
export 'package:clean_architecture_core/router/core_router.dart';
export 'package:clean_architecture_core/router/navigator_service.dart';
export 'package:clean_architecture_core/utilities/catch_and_map_exception.dart';
export 'package:clean_architecture_core/utilities/extension.dart';

GetIt getIt = GetIt.I;

class Core {
  static void init(
    CoreRouter appRouter,
    AppErrorDelegate appErrorDelegate,
    VoidCallback dependencies,
  ) {
    registerDependencies(appRouter, appErrorDelegate, dependencies);
  }
}
