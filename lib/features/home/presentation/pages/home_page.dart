import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod3_starter/app/router/app_routes.dart';
import 'package:riverpod3_starter/features/auth/presentation/providers/auth_controller.dart';
import 'package:riverpod3_starter/features/auth/presentation/providers/current_user_provider.dart';
import 'package:riverpod3_starter/shared/widgets/layout/app_scaffold.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return AppScaffold(
      title: '홈',
      actions: [
        IconButton(
          onPressed: () => context.push(AppRoutes.profile),
          icon: const Icon(Icons.person_outline),
        ),
      ],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '안녕하세요, ${user?.name ?? '게스트'}님',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text('실무형 Riverpod 3 starter의 기본 흐름을 확인할 수 있습니다.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => context.push(AppRoutes.products),
            child: const Text('상품 예제 보기'),
          ),
          const SizedBox(height: 12),
          FilledButton.tonal(
            onPressed: () => context.push(AppRoutes.posts),
            child: const Text('게시글 CRUD 예제'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () =>
                ref.read(authControllerProvider.notifier).signOut(),
            child: const Text('로그아웃'),
          ),
        ],
      ),
    );
  }
}
