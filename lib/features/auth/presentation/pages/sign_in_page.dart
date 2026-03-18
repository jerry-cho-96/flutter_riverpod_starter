import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/features/auth/presentation/providers/auth_controller.dart';
import 'package:riverpod3_starter/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:riverpod3_starter/shared/widgets/text/section_title.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF6F8FC), Color(0xFFE1ECFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Card(
              margin: const EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    SectionTitle(
                      'Riverpod 3 Starter',
                      subtitle: 'DummyJSON: emilys / emilyspass',
                    ),
                    SizedBox(height: 24),
                    SignInForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
