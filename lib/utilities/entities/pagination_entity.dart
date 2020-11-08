import 'package:flutter_core/clean/entities.dart';
import 'package:flutter_core/utilities/response_wrapper/response_wrapper.dart';

@Deprecated('Json serializable 3.5.0 support generics')
abstract class PaginationEntity<T extends Entity> extends ResponseWrapper<T> {

}