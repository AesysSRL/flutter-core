import '../clean_architecture_core.dart';

abstract class Repository<T extends DataSource> {
  final T dataSource;

  Repository([String? dataSourceInstanceName]) : dataSource = injector<T>(instanceName: dataSourceInstanceName);
}
