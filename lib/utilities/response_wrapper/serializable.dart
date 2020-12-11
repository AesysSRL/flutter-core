
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Serializable extends Equatable {
  Map<String, dynamic> toJson();
}

@Deprecated('')
abstract class SerializableConverter<ResponseType extends Serializable>
    implements JsonConverter<ResponseType, Map<String, dynamic>> {
  const SerializableConverter();

  @override
  ResponseType fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson(ResponseType object) => object.toJson();
}

abstract class RequestConverter<T extends Serializable>
    implements JsonConverter<T, Map<String, dynamic>> {
  const RequestConverter();

  @override
  T fromJson(Map<String, dynamic> json) => json as T;

  @override
  Map<String, dynamic> toJson(T object) => object.toJson();
}

abstract class ResponseConverter<T>
    implements JsonConverter<T, Map<String, dynamic>> {
  const ResponseConverter();

  @override
  T fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson(T object) => {};
}
