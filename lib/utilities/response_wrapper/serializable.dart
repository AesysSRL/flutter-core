import 'package:json_annotation/json_annotation.dart';

abstract class Serializable {
  Map<String, dynamic> toJson();
}

class SerializableConverter<ResponseType extends Serializable>
    implements JsonConverter<ResponseType, Map<String, dynamic>> {
  const SerializableConverter();

  @override
  ResponseType fromJson(Map<String, dynamic> json) {
    switch (ResponseType) {
      default:
        throw Exception('Missing from Json implementation case in serializable.dart');
    }
  }

  @override
  Map<String, dynamic> toJson(ResponseType object) => object.toJson();
}
