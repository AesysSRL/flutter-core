import 'package:clean_architecture_core/clean/data_source.dart';
import 'package:clean_architecture_core/clean_architecture_core.dart';

abstract class Repository<T extends DataSource> {
   final T dataSource;

   Repository([String? dataSourceInstanceName]) : dataSource = getIt<T>(instanceName: dataSourceInstanceName);
}