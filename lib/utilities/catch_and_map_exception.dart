import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';

import '../error_mapping/app_error.dart';
import '../service_locator_initializer.dart';

Future<Either<AppError, R>> checkConnectionAndCatchException<R>(Function call) async {
  var connectivityResult = (await catchException(getIt<Connectivity>().checkConnectivity)).fold((l) => ConnectivityResult.none, (r) => r);
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