// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseWrapper<ResponseType>
    _$ResponseWrapperFromJson<ResponseType extends Serializable>(
        Map<String, dynamic> json) {
  return ResponseWrapper<ResponseType>(
    size: json['size'] as int,
    totalCount: json['totalCount'] as int,
    results: (json['results'] as List)
        ?.map((e) => SerializableConverter<ResponseType>()
            .fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseWrapperToJson<ResponseType extends Serializable>(
        ResponseWrapper<ResponseType> instance) =>
    <String, dynamic>{
      'size': instance.size,
      'totalCount': instance.totalCount,
      'results': instance.results
          ?.map(SerializableConverter<ResponseType>().toJson)
          ?.toList(),
    };
