import 'package:json_annotation/json_annotation.dart';

part 'deletion_entity.g.dart';

@JsonSerializable()
class DeletionEntity {
    final bool deleted;

    DeletionEntity(this.deleted);

    factory DeletionEntity.fromJson(Map<String, dynamic> json) => _$DeletionEntityFromJson(json);

    Map<String, dynamic> toJson() => _$DeletionEntityToJson(this);
}