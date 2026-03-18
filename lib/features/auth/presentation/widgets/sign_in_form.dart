import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/features/auth/presentation/providers/auth_controller.dart';
import 'package:riverpod3_starter/features/auth/presentation/providers/auth_form_controller.dart';
import 'package:riverpod3_starter/shared/widgets/app_button.dart';
import 'package:riverpod3_starter/shared/widgets/app_text_field.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(authFormControllerProvider);
    final authState = ref.watch(authControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextField(
          label: '아이디',
          initialValue: form.username,
          onChanged: ref
              .read(authFormControllerProvider.notifier)
              .updateUsername,
        ),
        const SizedBox(height: 12),
        AppTextField(
          label: '비밀번호',
          initialValue: form.password,
          obscureText: true,
          onChanged: ref
              .read(authFormControllerProvider.notifier)
              .updatePassword,
        ),
        const SizedBox(height: 20),
        AppButton(
          label: '로그인',
          isLoading: authState.isLoading,
          onPressed: () {
            ref
                .read(authControllerProvider.notifier)
                .signIn(username: form.username, password: form.password);
          },
        ),
      ],
    );
  }
}
