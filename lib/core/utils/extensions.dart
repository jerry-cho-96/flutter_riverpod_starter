extension NullableIterableX<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T value) predicate) {
    for (final item in this) {
      if (predicate(item)) {
        return item;
      }
    }
    return null;
  }
}
