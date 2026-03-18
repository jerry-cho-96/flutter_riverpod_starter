// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productsRemoteDataSource)
const productsRemoteDataSourceProvider = ProductsRemoteDataSourceProvider._();

final class ProductsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ProductsRemoteDataSource,
          ProductsRemoteDataSource,
          ProductsRemoteDataSource
        >
    with $Provider<ProductsRemoteDataSource> {
  const ProductsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProductsRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductsRemoteDataSource create(Ref ref) {
    return productsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsRemoteDataSource>(value),
    );
  }
}

String _$productsRemoteDataSourceHash() =>
    r'1a88e7249a71ae855eb9dce525d7dcdd40035d03';
