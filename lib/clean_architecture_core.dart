library clean_architecture_core;


import 'package:clean_architecture_core/error_mapping/app_error.dart';
import 'package:clean_architecture_core/router/core_navigator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

export 'package:clean_architecture_core/clean/core_provider.dart';
export 'package:clean_architecture_core/clean/core_store.dart';
export 'package:clean_architecture_core/clean/data_source.dart';
export 'package:clean_architecture_core/clean/entities.dart';
export 'package:clean_architecture_core/clean/repository.dart';
export 'package:clean_architecture_core/clean/use_case.dart';
export 'package:clean_architecture_core/error_mapping/app_error.dart';
export 'package:clean_architecture_core/error_mapping/network_exception.dart';
export 'package:clean_architecture_core/http_client/authorization_interceptor.dart';
export 'package:clean_architecture_core/http_client/dio_factory.dart';
export 'package:clean_architecture_core/json_converters/date_time_iso_8601_converter.dart';
export 'package:clean_architecture_core/json_converters/only_date_converter.dart';
export 'package:clean_architecture_core/response_wrapper/converter.dart';
export 'package:clean_architecture_core/response_wrapper/response_wrapper.dart';
export 'package:clean_architecture_core/router/core_navigator.dart';
export 'package:clean_architecture_core/router/core_router.dart';
export 'package:clean_architecture_core/utilities/catch_and_map_exception.dart';
export 'package:clean_architecture_core/utilities/extension.dart';
export 'package:clean_architecture_core/utilities/jwt_utils.dart';
export 'package:clean_architecture_core/utilities/regex.dart';

final getIt = GetIt.I;

class Core {
  static Future<void> init(AppErrorMessageDelegate appErrorMessageDelegate) async {
    final deviceLocale = await Devicelocale.currentLocale;
    Intl.defaultLocale = deviceLocale;
    getIt
      ..registerLazySingleton<CoreNavigator>(() => CoreNavigator(), instanceName: 'root')
      ..registerLazySingleton<Connectivity>(() => Connectivity())
      ..registerLazySingleton<AppErrorMessageDelegate>(() => appErrorMessageDelegate);
  }
}
