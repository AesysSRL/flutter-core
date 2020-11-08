import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@Deprecated('use unnecessary JsonSerializable version 3.5.0 support generics')
abstract class Serializable extends Equatable {
  Map<String, dynamic> toJson();
}

@Deprecated('use unnecessary JsonSerializable version 3.5.0 support generics')
abstract class SerializableConverter<ResponseType extends Serializable>
    implements JsonConverter<ResponseType, Map<String, dynamic>> {
  const SerializableConverter();

  @override
  ResponseType fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson(ResponseType object) => object.toJson();
}
