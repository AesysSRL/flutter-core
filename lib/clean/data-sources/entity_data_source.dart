import 'package:flutter_core/utilities/entities/deletion_entity.dart';
import 'package:flutter_core/utilities/entities/filter_options.dart';
import 'package:flutter_core/utilities/entities/pagination_entity.dart';
import 'package:flutter_core/utilities/entities/pagination_options.dart';

import '../entity.dart';
import 'data_source.dart';

abstract class EntityDataSource<I extends Entity, O extends Entity> extends DataSource<I, O> {
Future<List<I>> getAll(FilterOptions options);

Future<PaginationEntity<I>> getAllPaginated(PaginationOptions options);

Future<I> get<T>(T id);

Future<I> insert(O entity);

Future<I> edit(O entity);

Future<DeletionEntity> delete<T>(T id);
}
