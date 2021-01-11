import 'package:clean_architecture_core/error_mapping/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class AsyncUseCaseWithErrorHandling<I, R> {
  Future<Either<AppError, R>> call([I param]);
}

abstract class AsyncUseCase<I, R> {
  Future<R> call([I param]);
}

abstract class SyncUseCaseWithErrorHandling<I, R> {
  Either<AppError, R> call([I param]);
}

abstract class SyncUseCase<I, R> {
  R call([I param]);
}