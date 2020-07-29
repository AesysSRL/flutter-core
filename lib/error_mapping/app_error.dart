import 'package:flutter/foundation.dart';
import 'package:flutter_core/service_locator_initializer.dart';

class AppError {
  final String message;

  AppError(this.message);

  factory AppError.genericError() => AppError(getIt.get<AppErrorDefaultMessages>().genericError());

  factory AppError.offline() => AppError(getIt.get<AppErrorDefaultMessages>().offlineError());

  factory AppError.fromException(e) {
    AppError(getIt.get<AppErrorDefaultMessages>().errorMessageFromException(e));
    return AppError(getIt.get<AppErrorDefaultMessages>().genericError());
  }
}

class AppErrorDefaultMessages {
  final TranslateFunction genericError;
  final TranslateFunction offlineError;
  final TranslateExceptionFunction errorMessageFromException;

  AppErrorDefaultMessages({@required this.genericError, @required this.offlineError, @required this.errorMessageFromException});
}

typedef TranslateFunction = String Function();
typedef TranslateExceptionFunction = String Function(dynamic);

typedef OnError = void Function(AppError appError);