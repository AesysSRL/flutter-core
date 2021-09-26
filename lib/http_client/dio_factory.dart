import 'package:clean_architecture_core/error_mapping/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:loggy/loggy.dart';

class DioFactory {
  static const String _defaultDio = 'default';
  static final Map<String, Dio> _dioInstances = {};

  // ---------------------------------------------------------------------------
  //                                                       Dio instances manager
  // ---------------------------------------------------------------------------
  static void initialize(
      {List<Interceptor> interceptors = const <Interceptor>[], bool logging = true}) {
    newDioInstance(_defaultDio, interceptors: interceptors, logging: logging);
  }

  static void newDioInstance(String dioInstanceName,
      {List<Interceptor> interceptors = const <Interceptor>[], bool logging = true}) {
    final dioInstance = Dio();
    if (!kReleaseMode && logging) {
      dioInstance.interceptors.add(LoggyDioInterceptor(
        requestHeader: true,
        requestBody: true,
        maxWidth: 160,
        requestLevel: LogLevel.debug,
        responseLevel: LogLevel.debug,
        errorLevel: LogLevel.warning,
      ));
    }
    _dioInstances[dioInstanceName] = dioInstance..interceptors.addAll([...interceptors, ErrorMapperInterceptor()]);
  }

  static Dio getDioInstance([String dioInstanceName = _defaultDio]) {
    if (_dioInstances.isEmpty) {
      throw Exception('no Dio has been evocated, have to call initilize() or newDioInstance()');
    }
    if (!_dioInstances.containsKey(dioInstanceName)) {
      throw Exception('there is no Dio with this name');
    }
    return _dioInstances[dioInstanceName]!;
  }

  static int getNumberOfDioInstances() {
    return _dioInstances.length;
  }
}

class ErrorMapperInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    err = NetworkException(
        requestOptions: err.requestOptions,
        message: err.response?.statusMessage ?? 'Generic network exception',
        code:  err.response?.statusCode ?? 999);
    super.onError(err, handler);
  }
}
