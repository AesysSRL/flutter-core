import 'package:clean_architecture_core/clean_architecture_core.dart';
import 'package:flutter/foundation.dart';

class AppError {
  final int code;
  final String message;

  AppError({this.code, @required this.message});

  factory AppError.genericError() => AppError(code: 0, message: Core.getIt?.call<AppErrorMessageDelegate>()?.genericErrorMessage());

  factory AppError.offline() => AppError(code: 1, message: Core.getIt?.call<AppErrorMessageDelegate>()?.offlineErrorMessage());

  factory AppError.fromException(e) {
    return Core.getIt?.call<AppErrorMessageDelegate>()?.appErrorFromException(e);
  }

  @override
  bool operator ==(o) => o is AppError &&  o.hashCode == hashCode;

  @override
  int get hashCode => code.hashCode + message.hashCode;

  @override
  String toString() {
    return 'code: $code, message: $message';
  }
}

class AppErrorMessageDelegate {
  final TranslateFunction genericErrorMessage;
  final TranslateFunction offlineErrorMessage;
  final AppErrorFromExceptionFunction appErrorFromException;

  const AppErrorMessageDelegate({@required this.genericErrorMessage, @required this.offlineErrorMessage, @required this.appErrorFromException});
}

typedef TranslateFunction = String Function();
typedef AppErrorFromExceptionFunction = AppError Function(dynamic);

typedef OnError = void Function(AppError appError);