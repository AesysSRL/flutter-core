import 'package:dartz/dartz.dart';
import 'package:flutter_core/error_mapping/app_error.dart';

@Deprecated('Use specific use case')
abstract class UseCase<I, O, R> {
  Future<Either<AppError, R>> call([I param1, O param2]);
}

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