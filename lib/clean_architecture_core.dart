library clean_architecture_core;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';

import 'error_mapping/failure.dart';

export 'package:clean_architecture_core/clean/core_provider.dart';
export 'package:clean_architecture_core/clean/core_store.dart';
export 'package:clean_architecture_core/clean/data_source.dart';
export 'package:clean_architecture_core/clean/entities.dart';
export 'package:clean_architecture_core/clean/repository.dart';
export 'package:clean_architecture_core/clean/use_case.dart';
export 'package:clean_architecture_core/error_mapping/failure.dart';
export 'package:clean_architecture_core/error_mapping/network_exception.dart';
export 'package:clean_architecture_core/http_client/authorization_interceptor.dart';
export 'package:clean_architecture_core/http_client/dio_factory.dart';
export 'package:clean_architecture_core/json_converters/date_time_iso_8601_converter.dart';
export 'package:clean_architecture_core/json_converters/only_date_converter.dart';
export 'package:clean_architecture_core/response_wrapper/converter.dart';
export 'package:clean_architecture_core/response_wrapper/response_wrapper.dart';
export 'package:clean_architecture_core/utilities/catch_and_map_exception.dart';
export 'package:clean_architecture_core/utilities/extension.dart';
export 'package:clean_architecture_core/utilities/jwt_utils.dart';
export 'package:clean_architecture_core/utilities/regex.dart';
export 'package:dio/dio.dart';
export 'package:loggy/loggy.dart';

final injector = GetIt.I;

class Core {
  static Future<void> init(FailureMessageDelegate appErrorMessageDelegate) async {
    Intl.defaultLocale = await Devicelocale.currentLocale;
    injector
      ..registerLazySingleton<Connectivity>(() => Connectivity())
      ..registerLazySingleton<FailureMessageDelegate>(() => appErrorMessageDelegate);
    Loggy.initLoggy(
        logOptions: const LogOptions(
          kReleaseMode ? LogLevel.off : LogLevel.all,
          includeCallerInfo: true,
          stackTraceLevel: LogLevel.error,
        ),
        logPrinter: const PrettyDeveloperPrinter());
  }
}
