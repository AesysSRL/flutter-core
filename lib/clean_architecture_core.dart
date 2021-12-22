library clean_architecture_core;

import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';

import 'dependency_injection/injector_configuration.dart';
import 'error_mapping/failure.dart';

export 'package:clean_architecture_core/clean/use_case.dart';
export 'package:clean_architecture_core/dependency_injection/injector_configuration.dart';
export 'package:clean_architecture_core/error_mapping/failure.dart';
export 'package:clean_architecture_core/error_mapping/network_failure.dart';
export 'package:clean_architecture_core/http_client/dio_factory.dart';
export 'package:clean_architecture_core/json_converters/date_time_iso_8601_converter.dart';
export 'package:clean_architecture_core/json_converters/only_date_converter.dart';
export 'package:clean_architecture_core/utilities/catch_and_map_exception.dart';
export 'package:clean_architecture_core/utilities/extension.dart';
export 'package:clean_architecture_core/utilities/jwt_utils.dart';
export 'package:clean_architecture_core/utilities/regex.dart';
export 'package:dio/dio.dart';
export 'package:fpdart/fpdart.dart';
export 'package:get_it/get_it.dart';
export 'package:injectable/injectable.dart';
export 'package:intl/intl.dart';
export 'package:loggy/loggy.dart';
export 'package:shared_preferences/shared_preferences.dart';

class Core {
  static Future<void> init(FailureMessageDelegate appErrorMessageDelegate) async {
    Intl.defaultLocale = await Devicelocale.currentLocale;
    injector.registerLazySingleton<FailureMessageDelegate>(() => appErrorMessageDelegate);
    await initInjector();
    Loggy.initLoggy(
      logOptions: const LogOptions(
        kReleaseMode ? LogLevel.off : LogLevel.all,
        includeCallerInfo: true,
        stackTraceLevel: LogLevel.error,
      ),
      logPrinter: const PrettyDeveloperPrinter(),
    );
  }
}
