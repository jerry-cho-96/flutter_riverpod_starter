// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductsListController)
const productsListControllerProvider = ProductsListControllerProvider._();

final class ProductsListControllerProvider
    extends
        $AsyncNotifierProvider<ProductsListController, PagedState<Product>> {
  const ProductsListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsListControllerHash();

  @$internal
  @override
  ProductsListController create() => ProductsListController();
}

String _$productsListControllerHash() =>
    r'469f7a4f4915439a7c06b5552ddb39e89b26c5f4';

abstract class _$ProductsListController
    extends $AsyncNotifier<PagedState<Product>> {
  FutureOr<PagedState<Product>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<PagedState<Product>>, PagedState<Product>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PagedState<Product>>, PagedState<Product>>,
              AsyncValue<PagedState<Product>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
