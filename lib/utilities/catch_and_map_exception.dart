import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';

import '../clean_architecture_core.dart';
import '../error_mapping/failure.dart';

Future<Either<Failure, R>> checkConnectionAndCatchException<R>(Future<R> Function() call) async {
  final connectivityResult =
      (await catchException(injector<Connectivity>().checkConnectivity)).fold((l) => ConnectivityResult.none, (r) => r);
  if (connectivityResult == ConnectivityResult.none) {
    return Either.left(Failure.offline());
  }
  return catchException(call);
}

Future<Either<Failure, R>> checkConnectionAndCatchExceptionSync<R>(R Function() call) async {
  final connectivityResult =
      (await catchException(injector<Connectivity>().checkConnectivity)).fold((l) => ConnectivityResult.none, (r) => r);
  if (connectivityResult == ConnectivityResult.none) {
    return Either.left(Failure.offline());
  }
  return catchExceptionSync(call);
}

Future<Either<Failure, R>> catchException<R>(Future<R> Function() call, {FailureFromExceptionFunction? onError}) async {
  try {
    return Either.of(await call());
  } catch (e) {
    return Either.left(onError?.call(e) ?? Failure.fromException(e));
  }
}

Either<Failure, R> catchExceptionSync<R>(R Function() call, {FailureFromExceptionFunction? onError}) {
  return Either.tryCatch(() => call(), (e, _) => onError?.call(e) ?? Failure.fromException(e));
}
