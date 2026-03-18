import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/features/auth/domain/entities/user.dart';
import 'package:riverpod3_starter/features/auth/presentation/providers/auth_controller.dart';

part 'current_user_provider.g.dart';

@riverpod
User? currentUser(Ref ref) {
  return ref.watch(authControllerProvider).asData?.value?.user;
}
