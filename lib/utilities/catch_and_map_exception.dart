import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';

import '../clean_architecture_core.dart';
import '../error_mapping/app_error.dart';

Future<Either<AppError, R>> checkConnectionAndCatchException<R>(Function call) async {
  final connectivityResult = (await catchException(getIt<Connectivity>().checkConnectivity)).fold((l) => ConnectivityResult.none, (r) => r);
  if (connectivityResult == ConnectivityResult.none) {
    return Left(AppError.offline());
  }
  return catchException(call);
}

Future<Either<AppError, R>> catchException<R>(Function call, {AppErrorFromExceptionFunction? onError}) async {
  try {
    final result = await call();
    return Right(result);
  } catch (e) {
    if(onError != null){
      return Left(onError(e));
    }
    return Left(AppError.fromException(e));
  }
}

Either<AppError, R> catchExceptionSync<R>(Function call, {AppErrorFromExceptionFunction? onError}) {
  try {
    final result = call();
    return Right(result);
  } catch (e) {
    if(onError != null){
      return Left(onError(e));
    }
    return Left(AppError.fromException(e));
  }
}
