import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension $DateTime on DateTime {
  DateTime get onlyDate {
    return DateTime(year, month, day);
  }

  DateTime get startOfMonth {
    return DateTime(year, month, 0).add(const Duration(days: 1));
  }

  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0);
  }
}

extension $Double on double {
  /// Transform double to string with [decimals] numbers of decimal digits
  ///
  /// If the double is round at the whole number not show the decimals zeros
  /// Example:
  ///   23.456.formatWithoutDecimalZero(2) -> "23.45"
  ///   23.456.formatWithoutDecimalZero(1) -> "23.4"
  ///   23.0.formatWithoutDecimalZero(1) -> "23"
  String formatWithoutDecimalZero(int decimals) {
    return toStringAsFixed(truncateToDouble() == this ? 0 : decimals);
  }
}

extension $Num on num {
  String currency({String symbol = '€'}) {
    return NumberFormat.currency(decimalDigits: 2, symbol: symbol).format(this);
  }

  num divide(num divider) => this / divider;
}

extension $String on String {
  String get absoluteRoute => '/$this';

  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  bool get isValidUrl => RegExp(
          r'^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z0-9\u00a1-\uffff][a-z0-9\u00a1-\uffff_-]{0,62})?[a-z0-9\u00a1-\uffff]\.)+(?:[a-z\u00a1-\uffff]{2,}\.?))(?::\d{2,5})?(?:[/?#]\S*)?$')
      .hasMatch(this);
}

extension $Iterable<E> on Iterable<E> {
  E? get firstOrNull {
    if (isNotEmpty) return first;
    return null;
  }

  E? get lastOrNull {
    if (isNotEmpty) return last;
    return null;
  }

  bool containsAll(Iterable<E> items) {
    for (final item in items) {
      if (!contains(item)) {
        return false;
      }
    }
    return true;
  }
}

extension $IterableNullValue<E extends Object?> on Iterable<E?> {
  E? get firstOrNull {
    if (isNotEmpty) return first;
    return null;
  }

  E? get lastOrNull {
    if (isNotEmpty) return last;
    return null;
  }

  bool containsAll(Iterable<E?> items) {
    for (final item in items) {
      if (!contains(item)) {
        return false;
      }
    }
    return true;
  }
}

extension $StringNullable on String? {
  bool get isNullOrEmpty => this == null || this == '';

  bool get isNotNullOrEmpty => this != null && this != '';
}

R run<R>(R Function() operation) {
  return operation();
}

extension ScopeFunctionsForObject<T extends Object> on T {
  E let<E>(E Function(T value) operationFor) {
    return operationFor(this);
  }

  T also(void Function(T value) operationFor) {
    operationFor(this);
    return this;
  }
}

extension $TimeOfDay on TimeOfDay {
  /// Compares this object to another object.
  ///
  /// It returns a negative integer if `this` is ordered before [other],
  /// a positive integer if `this` is ordered after [other],
  /// and zero if `this` and [other] are ordered together.
  ///
  /// The [other] argument is a [TimeOfDay] to compare with this.
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is ordered before [other]
  bool isBefore(TimeOfDay other) => compareTo(other) == -1;

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is ordered after [other]
  bool isAfter(TimeOfDay other) => compareTo(other) == 1;

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is equals [other]
  bool isSame(TimeOfDay other) => compareTo(other) == 0;

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is ordered after [start] and before [end]
  bool isBetween(TimeOfDay start, TimeOfDay end) => isAfter(start) && isBefore(end);

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is ordered after [start] or equals [start] and before [end] or equals [end]
  bool isBetweenInclusive(TimeOfDay start, TimeOfDay end) =>
      (isAfter(start) || isSame(start)) && (isBefore(end) || isSame(end));
}
