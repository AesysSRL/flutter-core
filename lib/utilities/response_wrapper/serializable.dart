import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Serializable implements Equatable {
  Map<String, dynamic> toJson();
}

abstract class SerializableConverter<ResponseType extends Serializable>
    implements JsonConverter<ResponseType, Map<String, dynamic>> {
  const SerializableConverter();

  @override
  ResponseType fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson(ResponseType object) => object.toJson();
}
