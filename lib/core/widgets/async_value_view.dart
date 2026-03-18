import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod3_starter/core/widgets/app_empty_view.dart';
import 'package:riverpod3_starter/core/widgets/app_error_view.dart';
import 'package:riverpod3_starter/core/widgets/app_loading_view.dart';

class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({
    required this.value,
    required this.data,
    this.onRetry,
    this.emptyMessage,
    super.key,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? onRetry;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (resolved) {
        if (resolved is Iterable && resolved.isEmpty && emptyMessage != null) {
          return AppEmptyView(message: emptyMessage!);
        }
        return data(resolved);
      },
      error: (error, stackTrace) =>
          AppErrorView(message: error.toString(), onRetry: onRetry),
      loading: () => const AppLoadingView(),
    );
  }
}
