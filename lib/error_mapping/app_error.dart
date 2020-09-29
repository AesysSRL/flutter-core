import 'package:flutter/foundation.dart';
import 'package:flutter_core/service_locator_initializer.dart';

class AppError {
  final int code;
  final String message;

  AppError({this.code, @required this.message});

  factory AppError.genericError() => AppError(code: 0, message: getIt.get<AppErrorDelegate>().genericErrorMessage());

  factory AppError.offline() => AppError(code: 1, message: getIt.get<AppErrorDelegate>().offlineErrorMessage());

  factory AppError.fromException(e) {
    return getIt.get<AppErrorDelegate>().appErrorFromException(e);
  }
}

class AppErrorDelegate {
  final TranslateFunction genericErrorMessage;
  final TranslateFunction offlineErrorMessage;
  final AppErrorFromExceptionFunction appErrorFromException;

  const AppErrorDelegate({@required this.genericErrorMessage, @required this.offlineErrorMessage, @required this.appErrorFromException});
}

typedef TranslateFunction = String Function();
typedef AppErrorFromExceptionFunction = AppError Function(dynamic);

typedef OnError = void Function(AppError appError);