import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'serializable.dart';

part 'response_wrapper.g.dart';

@JsonSerializable()
class ResponseWrapper<ResponseType extends Serializable> {

  final int size;
  final int totalCount;
  @SerializableConverter()
  final List<ResponseType> results;

  ResponseWrapper({
    @required this.size,
    @required this.totalCount,
    @required this.results
  });

  factory ResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$ResponseWrapperFromJson<ResponseType>(json);

  Map<String, dynamic> toJson() => _$ResponseWrapperToJson(this);
}
