import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod3_starter/app/router/app_routes.dart';
import 'package:riverpod3_starter/app/router/route_guards.dart';
import 'package:riverpod3_starter/features/auth/presentation/pages/profile_page.dart';
import 'package:riverpod3_starter/features/auth/presentation/pages/sign_in_page.dart';
import 'package:riverpod3_starter/features/auth/presentation/providers/auth_controller.dart';
import 'package:riverpod3_starter/features/home/presentation/pages/home_page.dart';
import 'package:riverpod3_starter/features/posts/presentation/pages/post_detail_page.dart';
import 'package:riverpod3_starter/features/posts/presentation/pages/posts_page.dart';
import 'package:riverpod3_starter/features/products/presentation/pages/product_detail_page.dart';
import 'package:riverpod3_starter/features/products/presentation/pages/products_page.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authControllerProvider);
  final session = authState.asData?.value;

  return GoRouter(
    initialLocation: AppRoutes.home,
    redirect: (context, state) => authRedirect(
      session: session,
      isLoadingSession: authState.isLoading && !authState.hasValue,
      matchedLocation: state.matchedLocation,
    ),
    routes: [
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.products,
        builder: (context, state) => const ProductsPage(),
      ),
      GoRoute(
        path: AppRoutes.posts,
        builder: (context, state) => const PostsPage(),
      ),
      GoRoute(
        path: AppRoutes.postDetail,
        builder: (context, state) =>
            PostDetailPage(postId: int.parse(state.pathParameters['id']!)),
      ),
      GoRoute(
        path: '/products/:id',
        builder: (context, state) =>
            ProductDetailPage(productId: state.pathParameters['id']!),
      ),
    ],
  );
}
