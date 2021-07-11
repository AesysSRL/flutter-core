import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlyDateJsonConverter implements JsonConverter<DateTime?, String?> {
  const OnlyDateJsonConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json != null) {
      return DateFormat('yyyy-MM-dd').parse(json, true);
    }
    return null;
  }

  @override
  String? toJson(DateTime? object) {
    if (object != null) {
      return DateFormat('yyyy-MM-dd').format(object);
    }
    return null;
  }
}
