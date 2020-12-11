import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkException extends DioError {
  @override
  String message;
  int code;

  NetworkException({
    @required this.message,
    @required this.code
  });

  @override
  bool operator ==(o) => o is NetworkException &&  o.code == code && o.message == message;

  @override
  String toString() {
    return 'code: $code, message: $message';
  }
}