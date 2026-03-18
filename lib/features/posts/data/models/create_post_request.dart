import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_request.freezed.dart';
part 'create_post_request.g.dart';

@freezed
sealed class CreatePostRequest with _$CreatePostRequest {
  const factory CreatePostRequest({
    required int userId,
    required String title,
    required String body,
    @Default(<String>[]) List<String> tags,
  }) = _CreatePostRequest;

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestFromJson(json);
}
