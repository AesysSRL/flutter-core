import 'package:clean_architecture_core/error_mapping/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {}

abstract class AsyncUseCaseWithErrorHandling<I, R> implements UseCase {
  Future<Either<AppError, R>> call([I param]);
}

abstract class AsyncUseCase<I, R> implements UseCase {
  Future<R> call([I param]);
}

abstract class SyncUseCaseWithErrorHandling<I, R> implements UseCase {
  Either<AppError, R> call([I param]);
}

abstract class SyncUseCase<I, R> implements UseCase {
  R call([I param]);
}