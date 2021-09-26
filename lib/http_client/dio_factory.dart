import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
      dioInstance.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        maxWidth: 140,
        logPrint: (object) => debugPrint(object.toString()),
      ));
    }
    _dioInstances[dioInstanceName] = dioInstance..interceptors.addAll(interceptors);
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
