import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import 'app_error.dart';

Future<Either<AppError, R>> checkConnectionAndCatchException<R>(Function call) async {
  var connectivityResult = (await catchException(GetIt.I<Connectivity>().checkConnectivity)).fold((l) => ConnectivityResult.none, (r) => r);
  if(connectivityResult == ConnectivityResult.none) return Left(AppError.offline());
  return catchException(call);
}

Future<Either<AppError, R>> catchException<R>(Function call) async {
  try {
    final result = await call();
    return Right(result);
  } catch(e) {
    return Left(AppError.fromException(e));
  }
}