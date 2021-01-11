import 'package:clean_architecture_core/clean_architecture_core.dart';
import 'package:flutter/foundation.dart';

class AppError {
  final int code;
  final String message;

  AppError({this.code, @required this.message});

  factory AppError.genericError() => AppError(code: 0, message: getIt<AppErrorDelegate>().genericErrorMessage());

  factory AppError.offline() => AppError(code: 1, message: getIt<AppErrorDelegate>().offlineErrorMessage());

  factory AppError.fromException(e) {
    return getIt<AppErrorDelegate>().appErrorFromException(e);
  }

  @override
  bool operator ==(o) => o is AppError &&  o.code == code && o.message == message;

  @override
  String toString() {
    return 'code: $code, message: $message';
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