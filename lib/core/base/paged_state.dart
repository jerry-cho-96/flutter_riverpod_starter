class PagedState<T> {
  const PagedState({
    required this.items,
    required this.page,
    required this.isLoadingMore,
    required this.hasMore,
  });

  final List<T> items;
  final int page;
  final bool isLoadingMore;
  final bool hasMore;

  PagedState<T> copyWith({
    List<T>? items,
    int? page,
    bool? isLoadingMore,
    bool? hasMore,
  }) {
    return PagedState<T>(
      items: items ?? this.items,
      page: page ?? this.page,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
