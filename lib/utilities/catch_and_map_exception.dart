import 'package:connectivity/connectivity.dart';
import 'package:fpdart/fpdart.dart';

import '../clean_architecture_core.dart';
import '../error_mapping/app_error.dart';

Future<Either<AppError, R>> checkConnectionAndCatchException<R>(Future<R> Function() call) async {
  final connectivityResult = (await catchException(getIt<Connectivity>().checkConnectivity)).fold((l) => ConnectivityResult.none, (r) => r);
  if (connectivityResult == ConnectivityResult.none) {
    return Either.left(AppError.offline());
  }
  return catchException(call);
}

Future<Either<AppError, R>> checkConnectionAndCatchExceptionSync<R>(R Function() call) async {
  final connectivityResult = (await catchException(getIt<Connectivity>().checkConnectivity)).fold((l) => ConnectivityResult.none, (r) => r);
  if (connectivityResult == ConnectivityResult.none) {
    return Either.left(AppError.offline());
  }
  return catchExceptionSync(call);
}

Future<Either<AppError, R>> catchException<R>(Future<R> Function() call, {AppErrorFromExceptionFunction? onError}) async {
  try {
    return Either.of(await call());
  } catch (e) {
    return Either.left(onError?.call(e) ?? AppError.fromException(e));
  }
}

Either<AppError, R> catchExceptionSync<R>(R Function() call, {AppErrorFromExceptionFunction? onError}) {
  return Either.tryCatch(() => call(), (e, _) => onError?.call(e) ?? AppError.fromException(e));
}
