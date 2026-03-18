import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:riverpod3_starter/app/app.dart';
import 'package:riverpod3_starter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/user.dart';
import 'package:riverpod3_starter/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod3_starter/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';
import 'package:riverpod3_starter/features/posts/domain/repositories/posts_repository.dart';
import 'package:riverpod3_starter/features/products/data/repositories/products_repository_impl.dart';
import 'package:riverpod3_starter/features/products/domain/entities/product.dart';
import 'package:riverpod3_starter/features/products/domain/entities/products_query.dart';
import 'package:riverpod3_starter/features/products/domain/repositories/products_repository.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('iOS 스모크 테스트', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
          productsRepositoryProvider.overrideWithValue(
            _FakeProductsRepository(),
          ),
          postsRepositoryProvider.overrideWithValue(
            const _FakePostsRepository(),
          ),
        ],
        child: const App(),
      ),
    );

    await _pumpUntilVisible(tester, [find.text('로그인'), find.text('상품 예제 보기')]);

    if (find.text('로그인').evaluate().isNotEmpty) {
      await tester.tap(find.text('로그인'));
      await tester.pumpAndSettle(const Duration(seconds: 2));
    }

    await _pumpUntilVisible(tester, [find.text('상품 예제 보기')]);

    await tester.tap(find.text('상품 예제 보기'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('상품'), findsOneWidget);
    expect(find.text('Riverpod Notebook'), findsOneWidget);

    await tester.tap(find.text('Riverpod Notebook'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('상품 상세'), findsOneWidget);
    expect(find.textContaining('카테고리:'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.drag(find.byType(ListView).first, const Offset(0, -1200));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('더 불러오기'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('Riverpod Hoodie'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('프로필'), findsOneWidget);
    expect(find.text('Starter Admin'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.tap(find.text('게시글 CRUD 예제'));
    await _pumpUntilVisible(tester, [find.text('첫 번째 게시글')], maxAttempts: 20);

    expect(find.text('게시글 CRUD'), findsOneWidget);
    expect(find.text('첫 번째 게시글'), findsOneWidget);

    await tester.tap(find.text('첫 번째 게시글'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('게시글 상세'), findsOneWidget);
    expect(find.textContaining('userId:'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.tap(find.text('로그아웃'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('로그인'), findsOneWidget);
  });
}

Future<void> _pumpUntilVisible(
  WidgetTester tester,
  List<Finder> finders, {
  int maxAttempts = 10,
}) async {
  for (var i = 0; i < maxAttempts; i++) {
    await tester.pump(const Duration(milliseconds: 500));
    final hasMatch = finders.any((finder) => finder.evaluate().isNotEmpty);
    if (hasMatch) {
      return;
    }
  }

  fail('대상 위젯을 찾지 못했습니다.');
}

class _FakeAuthRepository implements AuthRepository {
  AuthSession? _session;

  @override
  Future<AuthSession?> restoreSession() async => _session;

  @override
  Future<AuthSession> signIn({
    required String username,
    required String password,
  }) async {
    _session = AuthSession(
      accessToken: 'integration-token',
      refreshToken: 'integration-refresh-token',
      user: User(
        id: '1',
        username: username,
        name: 'Starter Admin',
        email: 'emily.johnson@x.dummyjson.com',
      ),
    );
    return _session!;
  }

  @override
  Future<void> signOut() async {
    _session = null;
  }
}

class _FakePostsRepository implements PostsRepository {
  const _FakePostsRepository();

  @override
  Future<Post> createPost({
    required int userId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    return Post(id: 999, userId: userId, title: title, body: body, tags: tags);
  }

  @override
  Future<void> deletePost(int postId) async {}

  @override
  Future<Post> fetchPostDetail(int postId) async {
    return Post(
      userId: 1,
      id: postId,
      title: '첫 번째 게시글',
      body: '이것은 상세 본문입니다.',
      tags: const <String>['news'],
      views: 12,
    );
  }

  @override
  Future<List<Post>> fetchPosts({
    required int page,
    required int pageSize,
    String searchTerm = '',
  }) async {
    return <Post>[
      const Post(
        userId: 1,
        id: 1,
        title: '첫 번째 게시글',
        body: '이것은 첫 번째 본문입니다.',
        tags: <String>['news'],
        views: 12,
      ),
      const Post(
        userId: 1,
        id: 2,
        title: '두 번째 게시글',
        body: '이것은 두 번째 본문입니다.',
        tags: <String>['update'],
        views: 8,
      ),
    ];
  }

  @override
  Future<Post> updatePost({
    required int postId,
    required String title,
    required String body,
    List<String> tags = const <String>[],
  }) async {
    return Post(id: postId, userId: 1, title: title, body: body, tags: tags);
  }
}

class _FakeProductsRepository implements ProductsRepository {
  @override
  Future<List<String>> getCategories() async => <String>[
    'stationery',
    'apparel',
  ];

  @override
  Future<Product> getProductDetail(String productId) async {
    return Product(
      id: productId,
      name: 'Riverpod Notebook',
      description: '테스트용 상세 설명',
      price: 14.0,
      category: 'stationery',
      imageUrl: '',
    );
  }

  @override
  Future<List<Product>> getProductsPage({
    required ProductsQuery query,
    required int page,
    required int pageSize,
  }) async {
    if (page == 1) {
      return List<Product>.generate(
        10,
        (index) => Product(
          id: '${index + 1}',
          name: index == 0 ? 'Riverpod Notebook' : 'Riverpod Item ${index + 1}',
          description: '설명',
          price: 10 + index.toDouble(),
          category: index.isEven ? 'stationery' : 'lifestyle',
          imageUrl: '',
        ),
      );
    }

    return <Product>[
      const Product(
        id: '4',
        name: 'Riverpod Hoodie',
        description: '설명',
        price: 41,
        category: 'apparel',
        imageUrl: '',
      ),
    ];
  }
}
