import 'package:clean_architecture_core/error_mapping/app_error.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase {}

abstract class EitherAsyncUseCase<R> extends UseCase {
  Future<Either<AppError, R>> call();
}

abstract class AsyncUseCase<R> extends UseCase {
  Future<R> call();
}

abstract class EitherSyncUseCase<R> extends UseCase {
  Either<AppError, R> call();
}

abstract class SyncUseCase<R> extends UseCase {
  R call();
}

abstract class EitherAsyncUseCaseParam<I, R> extends UseCase {
  Future<Either<AppError, R>> call(I param);
}

abstract class AsyncUseCaseParam<I, R> extends UseCase {
  Future<R> call(I param);
}

abstract class EitherSyncUseCaseParam<I, R> extends UseCase {
  Either<AppError, R> call(I param);
}

abstract class SyncUseCaseParam<I, R> extends UseCase {
  R call(I param);
}
