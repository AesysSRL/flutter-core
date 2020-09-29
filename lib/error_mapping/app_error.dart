import 'package:flutter/foundation.dart';
import 'package:flutter_core/service_locator_initializer.dart';

class AppError {
  final int code;
  final String message;

  AppError({this.code, @required this.message});

  factory AppError.genericError() => AppError(code: 0, message: getIt.get<ErrorDefaultMessages>().genericErrorMessage());

  factory AppError.offline() => AppError(code: 1, message: getIt.get<ErrorDefaultMessages>().offlineErrorMessage());

  factory AppError.fromException(e) {
    return getIt.get<ErrorDefaultMessages>().appErrorFromException(e);
  }
}

class ErrorDefaultMessages {
  final TranslateFunction genericErrorMessage;
  final TranslateFunction offlineErrorMessage;
  final AppErrorFromExceptionFunction appErrorFromException;

  const ErrorDefaultMessages({@required this.genericErrorMessage, @required this.offlineErrorMessage, @required this.appErrorFromException});
}

typedef TranslateFunction = String Function();
typedef AppErrorFromExceptionFunction = AppError Function(dynamic);

typedef OnError = void Function(AppError appError);