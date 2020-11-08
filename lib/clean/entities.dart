import 'package:equatable/equatable.dart';
import 'package:flutter_core/utilities/response_wrapper/serializable.dart';

@Deprecated('use [ResponseEntity] or [RequestEntity]')
abstract class Entity extends Serializable {
}

abstract class RequestEntity extends Equatable {
  Map<String, dynamic> toJson();
}

abstract class ResponseEntity extends Equatable {
}
