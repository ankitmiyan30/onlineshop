class ApiException implements Exception {
  String message;
  String prefix;
  String url;
  ApiException([this.message, this.prefix, this.url]);
}

class BadRequestException extends ApiException {
  BadRequestException([String message, String url])
      : super(message, "Bad Request Exception");
}

class FetchDataException extends ApiException {
  FetchDataException([String message, String url])
      : super(message, "Fetch Data Exception");
}

class ApiNotRespondingException extends ApiException {
  ApiNotRespondingException([String message, String url])
      : super(message, "Api Not Responding Exception");
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String message, String url])
      : super(message, "Un Authorized Exception");
}
