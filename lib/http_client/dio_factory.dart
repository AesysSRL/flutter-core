import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../error_mapping/network_exception.dart';

class DioFactory {
  static const String _DEFAULT_DIO = 'default';
  final Map<String, Dio> _dioInstances = {};

  // ---------------------------------------------------------------------------
  //                                                    Singleton initialization
  // ---------------------------------------------------------------------------
  static final DioFactory _instance = DioFactory._();

  DioFactory get instance => _instance;

  DioFactory._();

  // ---------------------------------------------------------------------------
  //                                                       Dio instances manager
  // ---------------------------------------------------------------------------
  DioFactory initialize() {
    newDioInstance(_DEFAULT_DIO, ErrorMapperInterceptor());
    return _instance;
  }

  DioFactory newDioInstance(String dioInstanceName, Interceptor interceptor) {
    final dioInstance = Dio();
    dioInstance.interceptors.add(LoggingInterceptors());
    _dioInstances[dioInstanceName] = dioInstance..interceptors.add(interceptor);
    return _instance;
  }

  Dio getDioInstance([String dioInstanceName = _DEFAULT_DIO]) {
    if (_dioInstances.isEmpty) {
      throw Exception('no Dio has been evocated, have to call initilize() or newDioInstance()');
    }
    if (!_dioInstances.containsKey(dioInstanceName)) {
      throw Exception('there is no Dio with this name');
    }
    return _dioInstances[dioInstanceName]!;
  }

  int getNumberOfDioInstances() {
    return _dioInstances.length;
  }
}

class ErrorMapperInterceptor extends Interceptor {
  @override
  Future onError(DioError dioError) {
    dioError = NetworkException(
        message: dioError.response?.statusMessage ?? 'Generic network exception',
        code: dioError.response?.statusCode ?? 999);
    return super.onError(dioError);
  }
}

class LoggingInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    log('--> ${options.method.toUpperCase()} ${'' + (options.baseUrl) + (options.path)}');
    log('Headers:');
    options.headers.forEach((k, v) => log('$k: $v'));
    if (options.queryParameters.isNotEmpty) {
      log('queryParameters:');
      options.queryParameters.forEach((k, v) => log('$k: $v'));
    }
    if (options.data != null) {
      logWrapped('Body: ${options.data}');
    }
    log('--> END ${options.method.toUpperCase()}');

    return super.onRequest(options);
  }

  @override
  Future onError(DioError dioError) {
    log('<-- ${dioError.message} ${(dioError.response?.request != null ? '${dioError.response!.request.baseUrl}${dioError.response!.request.path}' : 'URL')}');
    log('${dioError.response?.data != null ? dioError.response!.data : 'Unknown Error'}');
    log('<-- End error');
    return super.onError(dioError);
  }

  @override
  Future onResponse(Response response) {
    log('<-- ${response.statusCode} ${response.request.baseUrl}${response.request.path}');
    log('Headers:');
    response.headers.forEach((k, v) => log('$k: $v'));
    logWrapped('Response: ${response.data}');
    log('<-- END HTTP');
    return super.onResponse(response);
  }
}

void logWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => log(match.group(0) ?? ''));
}
