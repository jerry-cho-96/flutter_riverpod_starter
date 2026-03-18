import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod3_starter/core/error/failure.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(Failure failure) = Error<T>;
}
