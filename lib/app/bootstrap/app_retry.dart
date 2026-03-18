import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/misc.dart';

import 'package:riverpod3_starter/core/error/app_exception.dart';

Duration? appRetry(int retryCount, Object error) {
  if (retryCount >= 3) {
    return null;
  }

  if (error is ProviderException ||
      error is ValidationException ||
      error is UnauthorizedException ||
      error is ForbiddenException ||
      error is NotFoundException) {
    return null;
  }

  if (error is SocketException || error is TimeoutException) {
    return Duration(milliseconds: 300 * (1 << retryCount));
  }

  if (error is ServerException && error.statusCode >= 500) {
    return Duration(milliseconds: 300 * (1 << retryCount));
  }

  return null;
}
