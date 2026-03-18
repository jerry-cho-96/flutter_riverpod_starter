// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loggingInterceptor)
const loggingInterceptorProvider = LoggingInterceptorProvider._();

final class LoggingInterceptorProvider
    extends $FunctionalProvider<Interceptor, Interceptor, Interceptor>
    with $Provider<Interceptor> {
  const LoggingInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggingInterceptorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggingInterceptorHash();

  @$internal
  @override
  $ProviderElement<Interceptor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Interceptor create(Ref ref) {
    return loggingInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Interceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Interceptor>(value),
    );
  }
}

String _$loggingInterceptorHash() =>
    r'c6dc196122737b705e369302d61722d2bf14c423';
