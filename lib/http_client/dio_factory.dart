import 'dart:async';

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
    var dioInstance = Dio();
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
    print('--> ${options.method.toUpperCase()} ${'' + (options.baseUrl) + (options.path)}');
    print('Headers:');
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters.isNotEmpty) {
      print('queryParameters:');
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      printWrapped('Body: ${options.data}');
    }
    print('--> END ${options.method.toUpperCase()}');

    return super.onRequest(options);
  }

  @override
  Future onError(DioError dioError) {
    print('<-- ${dioError.message} ${(dioError.response?.request != null ? '${dioError.response!.request.baseUrl}${dioError.response!.request.path}' : 'URL')}');
    print('${dioError.response?.data != null ? dioError.response!.data : 'Unknown Error'}');
    print('<-- End error');
    return super.onError(dioError);
  }

  @override
  Future onResponse(Response response) {
    print('<-- ${response.statusCode} ${response.request.baseUrl}${response.request.path}');
    print('Headers:');
    response.headers.forEach((k, v) => print('$k: $v'));
    printWrapped('Response: ${response.data}');
    print('<-- END HTTP');
    return super.onResponse(response);
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
