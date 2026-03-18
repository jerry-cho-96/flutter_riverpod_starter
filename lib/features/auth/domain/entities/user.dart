import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String name,
    required String email,
    String? imageUrl,
  }) = _User;
}
