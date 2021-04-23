
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../error_mapping/network_exception.dart';

class DioFactory {
  static const String _DEFAULT_DIO = 'default';
  static final Map<String, Dio> _dioInstances = {};

  // ---------------------------------------------------------------------------
  //                                                    Singleton initialization
  // ---------------------------------------------------------------------------
  static final DioFactory _instance = DioFactory._();

  static DioFactory get instance => _instance;

  DioFactory._();

  // ---------------------------------------------------------------------------
  //                                                       Dio instances manager
  // ---------------------------------------------------------------------------
  static DioFactory initialize() {
    newDioInstance(_DEFAULT_DIO, ErrorMapperInterceptor());
    return _instance;
  }

  static DioFactory newDioInstance(String dioInstanceName, Interceptor interceptor) {
    final dioInstance = Dio();
    if(!kReleaseMode) dioInstance.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    _dioInstances[dioInstanceName] = dioInstance..interceptors.add(interceptor);
    return _instance;
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
