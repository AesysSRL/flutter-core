import 'package:fpdart/fpdart.dart';

import '../error_mapping/failure.dart';

abstract class UseCase {}

abstract class EitherAsyncUseCase<R> extends UseCase {
  Future<Either<Failure, R>> call();
}

abstract class AsyncUseCase<R> extends UseCase {
  Future<R> call();
}

abstract class EitherSyncUseCase<R> extends UseCase {
  Either<Failure, R> call();
}

abstract class SyncUseCase<R> extends UseCase {
  R call();
}

abstract class EitherAsyncUseCaseParam<I, R> extends UseCase {
  Future<Either<Failure, R>> call(I param);
}

abstract class AsyncUseCaseParam<I, R> extends UseCase {
  Future<R> call(I param);
}

abstract class EitherSyncUseCaseParam<I, R> extends UseCase {
  Either<Failure, R> call(I param);
}

abstract class SyncUseCaseParam<I, R> extends UseCase {
  R call(I param);
}
