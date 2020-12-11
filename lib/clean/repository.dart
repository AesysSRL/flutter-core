import 'package:flutter_core/clean/data_source.dart';
import 'package:flutter_core/flutter_core.dart';

abstract class Repository<T extends DataSource> {
   T dataSource = getIt<T>();
}