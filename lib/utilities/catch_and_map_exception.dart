import 'package:connectivity_plus/connectivity_plus.dart';

import '../clean_architecture_core.dart';

Future<Either<Failure, ConnectivityResult>> _checkConnectivity() {
  return catchException(injector<Connectivity>().checkConnectivity);
}

Future<Either<Failure, R>> checkConnectionAndCatchException<R>(
  Future<R> Function() call, {
  FailureFromExceptionFunction? onFailure,
}) async {
  final connectivityResult = (await _checkConnectivity()).fold(
    (l) => ConnectivityResult.none,
    (r) => r,
  );
  if (connectivityResult == ConnectivityResult.none) {
    return Either.left(Failure.offline());
  }
  return catchException(call, onFailure: onFailure);
}

Future<Either<Failure, R>> checkConnectionAndCatchExceptionSync<R>(
  R Function() call, {
  FailureFromExceptionFunction? onFailure,
}) async {
  final connectivityResult = (await _checkConnectivity()).fold(
    (l) => ConnectivityResult.none,
    (r) => r,
  );
  if (connectivityResult == ConnectivityResult.none) {
    return Either.left(Failure.offline());
  }
  return catchExceptionSync(call, onFailure: onFailure);
}

Future<Either<Failure, R>> catchException<R>(
  Future<R> Function() call, {
  FailureFromExceptionFunction? onFailure,
}) async {
  try {
    return Either.of(await call());
  } catch (e) {
    return Either.left(onFailure?.call(e) ?? Failure.fromException(e));
  }
}

Either<Failure, R> catchExceptionSync<R>(
  R Function() call, {
  FailureFromExceptionFunction? onFailure,
}) {
  return Either.tryCatch(
      () => call(), (e, _) => onFailure?.call(e) ?? Failure.fromException(e));
}
