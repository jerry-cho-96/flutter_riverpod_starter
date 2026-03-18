import 'package:flutter_riverpod/misc.dart';

import 'package:riverpod3_starter/core/error/app_exception.dart';
import 'package:riverpod3_starter/core/error/failure.dart';

Failure mapErrorToFailure(Object error) {
  if (error is ProviderException) {
    return Failure.unknown(error.toString());
  }

  if (error is ValidationException) {
    return Failure.validation(error.message);
  }

  if (error is UnauthorizedException) {
    return Failure.unauthorized(error.message);
  }

  if (error is ForbiddenException) {
    return Failure.forbidden(error.message);
  }

  if (error is NotFoundException) {
    return Failure.notFound(error.message);
  }

  if (error is ServerException) {
    return Failure.server(error.message);
  }

  if (error is NetworkException) {
    return Failure.network(error.message);
  }

  if (error is AppException) {
    return Failure.unknown(error.message);
  }

  return Failure.unknown(error.toString());
}
