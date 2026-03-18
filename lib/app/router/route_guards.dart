import 'package:riverpod3_starter/app/router/app_routes.dart';
import 'package:riverpod3_starter/features/auth/domain/entities/auth_session.dart';

String? authRedirect({
  required AuthSession? session,
  required bool isLoadingSession,
  required String matchedLocation,
}) {
  if (isLoadingSession) {
    return null;
  }

  final goingToSignIn = matchedLocation == AppRoutes.signIn;
  final isSignedIn = session != null;

  if (!isSignedIn && !goingToSignIn) {
    return AppRoutes.signIn;
  }

  if (isSignedIn && goingToSignIn) {
    return AppRoutes.home;
  }

  return null;
}
