import 'package:dartz/dartz.dart';
import 'package:flutter_core/clean/repositories/repository.dart';
import 'package:flutter_core/error_mapping/app_error.dart';
import 'package:flutter_core/utilities/entities/filter_options.dart';
import 'package:flutter_core/utilities/entities/pagination_options.dart';
import 'package:flutter_core/utilities/models/deletion_model.dart';
import 'package:flutter_core/utilities/models/pagination_model.dart';

import '../model.dart';

abstract class EntityRepository<P, I extends Model, O extends Model> extends Repository<I, O> {
Future<Either<AppError, List<I>>> getAll(FilterOptions options);

Future<Either<AppError, PaginationModel<I>>> getAllPaginated(PaginationOptions options);

Future<Either<AppError, I>> get(P id);

Future<Either<AppError, I>> insert(O model);

Future<Either<AppError, I>> edit(O model);

Future<Either<AppError, DeletionModel>> delete(P id);
}
