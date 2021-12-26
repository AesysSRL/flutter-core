import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class NullableTimeOfDayJsonConverter implements JsonConverter<TimeOfDay?, String?> {
  const NullableTimeOfDayJsonConverter();

  @override
  TimeOfDay? fromJson(String? json) {
    if (json != null) {
      return TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(json));
    }
    return null;
  }

  @override
  String? toJson(TimeOfDay? object) {
    if (object != null) {
      return DateFormat('HH:mm').format(DateTime(0, 1, 1, object.hour, object.minute, 0, 0, 0));
    }
    return null;
  }
}

class TimeOfDayJsonConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayJsonConverter();

  @override
  TimeOfDay fromJson(String json) {
    return TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(json));
  }

  @override
  String toJson(TimeOfDay object) {
    return DateFormat('HH:mm').format(DateTime(0, 1, 1, object.hour, object.minute, 0, 0, 0));
  }
}
