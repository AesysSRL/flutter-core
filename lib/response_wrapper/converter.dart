import 'package:json_annotation/json_annotation.dart';

import '../clean/entities.dart';

abstract class RequestConverter<T extends Request> implements JsonConverter<T, Map<String, dynamic>> {
  const RequestConverter();

  @override
  T fromJson(Map<String, dynamic> json) => json as T;

  @override
  Map<String, dynamic> toJson(T object) => object.toJson();
}

abstract class ResponseConverter<T extends Response> implements JsonConverter<T, Map<String, dynamic>> {
  const ResponseConverter();

  @override
  T fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson(T object) => {};
}
