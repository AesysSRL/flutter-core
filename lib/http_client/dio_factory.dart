
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../error_mapping/network_exception.dart';

class DioFactory {
  static const String _DEFAULT_DIO = 'default';
  static final Map<String, Dio> _dioInstances = {};

  // ---------------------------------------------------------------------------
  //                                                       Dio instances manager
  // ---------------------------------------------------------------------------
  static void initialize({List<Interceptor> interceptors = const <Interceptor>[]}) {
    newDioInstance(_DEFAULT_DIO, interceptors: interceptors);
  }

  static void newDioInstance(String dioInstanceName, {List<Interceptor> interceptors = const <Interceptor>[]}) {
    final dioInstance = Dio();
    if(!kReleaseMode) dioInstance.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    _dioInstances[dioInstanceName] = dioInstance..interceptors.addAll(interceptors..add(ErrorMapperInterceptor()));
  }

  static Dio getDioInstance([String dioInstanceName = _DEFAULT_DIO]) {
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
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    dioError = NetworkException(
        requestOptions: dioError.requestOptions,
        message: dioError.response?.statusMessage ?? 'Generic network exception',
        code: dioError.response?.statusCode ?? 999);
    super.onError(dioError, handler);
  }
}
