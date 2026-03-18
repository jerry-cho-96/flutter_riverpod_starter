// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_query_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductsQueryController)
const productsQueryControllerProvider = ProductsQueryControllerProvider._();

final class ProductsQueryControllerProvider
    extends $NotifierProvider<ProductsQueryController, ProductsQuery> {
  const ProductsQueryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsQueryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsQueryControllerHash();

  @$internal
  @override
  ProductsQueryController create() => ProductsQueryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsQuery>(value),
    );
  }
}

String _$productsQueryControllerHash() =>
    r'6fea2513f8bbbcf0dd742745965c549e3d95ee2b';

abstract class _$ProductsQueryController extends $Notifier<ProductsQuery> {
  ProductsQuery build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProductsQuery, ProductsQuery>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductsQuery, ProductsQuery>,
              ProductsQuery,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
