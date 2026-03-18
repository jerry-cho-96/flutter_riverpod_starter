import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_query_controller.g.dart';

@riverpod
class PostsQueryController extends _$PostsQueryController {
  @override
  String build() => '';

  void updateSearchTerm(String value) {
    state = value;
  }
}
