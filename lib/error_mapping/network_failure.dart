import 'dart:core';

import 'package:dio/dio.dart';

class NetworkFailure extends DioError {
  @override
  String message;
  int code;

  NetworkFailure(
      {required RequestOptions requestOptions, required this.message, required this.code})
      : super(requestOptions: requestOptions);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkFailure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          code == other.code;

  @override
  int get hashCode => message.hashCode ^ code.hashCode;

  @override
  String toString() {
    return 'NetworkFailure{message: $message, code: $code}';
  }
}

class AppException implements Exception {
  String message;
  int code;

  AppException({required this.message, required this.code});
}
