import 'package:dio/dio.dart';

class NetworkException extends DioError {
  @override
  String message;
  int code;

  NetworkException({required RequestOptions requestOptions, required this.message, required this.code})
      : super(requestOptions: requestOptions);

  @override
  bool operator ==(o) => o is NetworkException && o.code == code && o.message == message;

  @override
  String toString() {
    return 'code: $code, message: $message';
  }

  @override
  int get hashCode => code.hashCode + message.hashCode;
}
