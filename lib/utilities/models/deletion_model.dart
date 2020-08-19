import 'package:flutter_core/utilities/entities/deletion_entity.dart';

class DeletionModel {
    final bool deleted;

    DeletionModel._(this.deleted);

    factory DeletionModel.fromEntity(DeletionEntity entity) => DeletionModel._(entity.deleted);
}