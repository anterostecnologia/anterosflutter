import 'package:anterosflutter/exceptions/api_error.dart';

class AnterosApiServiceException implements Exception {
  String? message;
  Apierror? apiError;

  AnterosApiServiceException({
    this.message,
    this.apiError,
  });

  @override
  String toString() =>
      'AnterosApiServiceException(message: $message, apierror: $apiError)';
}

class RouteException implements Exception {
  String? _message;

  RouteException(this._message) {
    this._message = _message;
  }

  @override
  String toString() {
    return "" + _message!;
  }
}
