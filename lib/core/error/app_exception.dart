class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

class ValidationException extends AppException {
  const ValidationException(super.message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message);
}

class ForbiddenException extends AppException {
  const ForbiddenException(super.message);
}

class NotFoundException extends AppException {
  const NotFoundException(super.message);
}

class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode = 500});

  final int statusCode;
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class UnknownAppException extends AppException {
  const UnknownAppException(super.message);
}
