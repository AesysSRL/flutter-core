import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class NullableDateTimeIso8601JsonConverter implements JsonConverter<DateTime?, String?> {
  const NullableDateTimeIso8601JsonConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json != null) {
      return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(json, true).toLocal();
    }
    return null;
  }

  @override
  String? toJson(DateTime? object) {
    if (object != null) {
      return object.toUtc().toIso8601String();
    }
    return null;
  }
}

class DateTimeIso8601JsonConverter implements JsonConverter<DateTime, String> {
  const DateTimeIso8601JsonConverter();

  @override
  DateTime fromJson(String json) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(json, true).toLocal();
  }

  @override
  String toJson(DateTime object) {
    return object.toUtc().toIso8601String();
  }
}
