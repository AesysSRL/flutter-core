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

extension $Num on num {
  String get currency {
    return NumberFormat.currency(decimalDigits: 2, symbol: '€').format(this);
  }

  num divide(num divider) => this / divider;
}

extension $ListWidget on List<Widget> {
  List<Widget> addVerticalSpacer(double space) {
    return asMap()
        .map((key, value) {
          if (key == length - 1) {
            return MapEntry(key, [value]);
          }
          return MapEntry(key, [value, SizedBox(height: space)]);
        })
        .values
        .fold(<Widget>[], (a, b) => [...a, ...b]);
  }

  List<Widget> addHorizontalSpacer(double space) {
    return asMap()
        .map((key, value) {
          if (key == length - 1) {
            return MapEntry(key, [value]);
          }
          return MapEntry(key, [value, SizedBox(width: space)]);
        })
        .values
        .fold(<Widget>[], (a, b) => [...a, ...b]);
  }

  List<Widget> addHorizontalDivider(Divider divider) {
    return asMap()
        .map((key, value) {
          if (key == length - 1) {
            return MapEntry(key, [value]);
          }
          return MapEntry(key, [value, divider]);
        })
        .values
        .fold(<Widget>[], (a, b) => [...a, ...b]);
  }
}

extension $String on String {
  bool get isValidEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
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
    for(final item in items){
      if(!contains(item)){
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
}

extension $List<E> on List<E> {
  bool containsAll(List<E> items) {
    for(final item in items){
      if(!contains(item)){
        return false;
      }
    }
    return true;
  }
}

extension $ListNullValue<E extends Object?> on List<E?> {
  bool containsAll(List<E?> items) {
    for(final item in items){
      if(!contains(item)){
        return false;
      }
    }
    return true;
  }
}

extension $StringNullable on String? {
  bool get isNullOrEmpty => this == null || this == '';

  bool get isNotNullOrEmpty => this != null || this != '';
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
