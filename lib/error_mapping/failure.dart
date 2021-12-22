import '../clean_architecture_core.dart';

class Failure {
  final int code;
  final String message;

  Failure({this.code = 999, required this.message});

  factory Failure.genericError() => Failure(
      code: 0,
      message: injector<FailureMessageDelegate>().genericErrorMessage());

  factory Failure.offline() => Failure(
      code: 1,
      message: injector<FailureMessageDelegate>().offlineErrorMessage());

  factory Failure.fromException(e) =>
      injector<FailureMessageDelegate>().failureFromException(e);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          message == other.message;

  @override
  int get hashCode => code.hashCode ^ message.hashCode;

  @override
  String toString() {
    return 'code: $code, message: $message';
  }
}

class FailureMessageDelegate {
  final TranslateFunction genericErrorMessage;
  final TranslateFunction offlineErrorMessage;
  final FailureFromExceptionFunction failureFromException;

  const FailureMessageDelegate({
    required this.genericErrorMessage,
    required this.offlineErrorMessage,
    required this.failureFromException,
  });
}

typedef TranslateFunction = String Function();
typedef FailureFromExceptionFunction = Failure Function(dynamic);

typedef OnError = void Function(Failure appError);
