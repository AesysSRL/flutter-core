import 'package:clean_architecture_core/error_mapping/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {}

abstract class AsyncUseCaseWithErrorHandling<I, R> extends UseCase {
  Future<Either<AppError, R>> call([I param]);
}

abstract class AsyncUseCase<I, R> extends UseCase {
  Future<R> call([I param]);
}

abstract class SyncUseCaseWithErrorHandling<I, R> extends UseCase {
  Either<AppError, R> call([I param]);
}

abstract class SyncUseCase<I, R> extends UseCase {
  R call([I param]);
}