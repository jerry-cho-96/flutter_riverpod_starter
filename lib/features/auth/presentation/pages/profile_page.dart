import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/features/auth/presentation/providers/current_user_provider.dart';
import 'package:riverpod3_starter/features/auth/presentation/widgets/profile_header.dart';
import 'package:riverpod3_starter/shared/widgets/app_scaffold.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return AppScaffold(
      title: '프로필',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: user == null
            ? const Center(child: Text('사용자 정보가 없습니다.'))
            : ProfileHeader(user: user),
      ),
    );
  }
}
