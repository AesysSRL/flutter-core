import 'package:equatable/equatable.dart';

import 'serializable.dart';

@Deprecated('use @JsonSerializable(genericArgumentFactories: true) on class with generic value')
abstract class ResponseWrapper<ResponseType extends Serializable> extends Equatable {
}
