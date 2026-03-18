import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_post_request.freezed.dart';
part 'update_post_request.g.dart';

@freezed
sealed class UpdatePostRequest with _$UpdatePostRequest {
  const factory UpdatePostRequest({
    required String title,
    required String body,
    @Default(<String>[]) List<String> tags,
  }) = _UpdatePostRequest;

  factory UpdatePostRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePostRequestFromJson(json);
}
