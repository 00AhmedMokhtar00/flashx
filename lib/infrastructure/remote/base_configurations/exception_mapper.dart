part of'flashx_api.dart';
class ExceptionMapper implements Exception {
  final _message;
  final _prefix;

  ExceptionMapper([this._prefix, this._message]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ExceptionMapper {
  FetchDataException(String message)
      : super("Error During Communication: ", message);
}

class BadRequestException extends ExceptionMapper {
  BadRequestException(String message) : super("Invalid Request: ", message);
}

class UnauthorisedException extends ExceptionMapper {
  UnauthorisedException(String message) : super("Unauthorised: ", message);
}

class InvalidInputException extends ExceptionMapper {
  InvalidInputException(String message) : super("Invalid Input: ", message);
}