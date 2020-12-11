import 'package:flutter_core/utilities/response_wrapper/serializable.dart';

@Deprecated('Use Response or Request')
abstract class Entity extends Serializable {
}

abstract class Request {
  Map<String, dynamic> toJson();
}

abstract class Response {
}