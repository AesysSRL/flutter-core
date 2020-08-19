import 'package:dartz/dartz.dart';
import 'package:flutter_core/error_mapping/app_error.dart';

abstract class UseCase<I, O, R> {
  Future<Either<AppError, R>> call([I param1, O param2]);
}