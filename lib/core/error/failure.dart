import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.validation(String message) = ValidationFailure;
  const factory Failure.unauthorized(String message) = UnauthorizedFailure;
  const factory Failure.forbidden(String message) = ForbiddenFailure;
  const factory Failure.notFound(String message) = NotFoundFailure;
  const factory Failure.server(String message) = ServerFailure;
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}
