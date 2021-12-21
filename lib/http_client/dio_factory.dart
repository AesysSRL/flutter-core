import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';

import '../clean_architecture_core.dart';

class DioFactory {
  static const String _defaultDio = 'default';

  // ---------------------------------------------------------------------------
  //                                                       Dio instances manager
  // ---------------------------------------------------------------------------
  static void initialize({
    List<Interceptor> interceptors = const <Interceptor>[],
    bool logging = true,
  }) {
    newDioInstance(_defaultDio, interceptors: interceptors, logging: logging);
  }

  static void newDioInstance(
    String dioInstanceName, {
    List<Interceptor> interceptors = const <Interceptor>[],
    bool logging = true,
  }) {
    final dioInstance = Dio();
    if (!kReleaseMode && logging) {
      dioInstance.interceptors.add(LoggyDioInterceptor(
        requestHeader: true,
        requestBody: true,
        requestLevel: LogLevel.info,
        responseLevel: LogLevel.info,
        errorLevel: LogLevel.warning,
      ));
    }
    injector.registerLazySingleton(
      () => dioInstance..interceptors.addAll([...interceptors, ErrorMapperInterceptor()]),
      instanceName: dioInstanceName,
    );
  }

  static Dio getDioInstance([String dioInstanceName = _defaultDio]) {
    try {
      return injector<Dio>(instanceName: dioInstanceName);
    } catch (e) {
      throw Failure(message: 'No Dio instance registered with name $dioInstanceName');
    }
  }
}

class ErrorMapperInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    err = NetworkFailure(
        requestOptions: err.requestOptions,
        message: err.response?.statusMessage ?? 'Generic network exception',
        code: err.response?.statusCode ?? 999);
    super.onError(err, handler);
  }
}
