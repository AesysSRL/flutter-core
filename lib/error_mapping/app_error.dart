import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class AppError {
  final int code;
  final String message;

  AppError({this.code, @required this.message});

  factory AppError.genericError() => AppError(code: 0, message: GetIt.I<AppErrorDelegate>().genericErrorMessage());

  factory AppError.offline() => AppError(code: 1, message: GetIt.I<AppErrorDelegate>().offlineErrorMessage());

  factory AppError.fromException(e) {
    return GetIt.I<AppErrorDelegate>().appErrorFromException(e);
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