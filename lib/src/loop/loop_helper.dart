class CancelableLoop {
  bool _isCancelled = false;

  void cancel() {
    _isCancelled = true;
  }

  Future<void> forEachAsync<T>(
      Iterable<T> items,
      Future<void> Function(T item, int index) action,
      ) async {
    _isCancelled = false;

    int index = 0;
    for (final item in items) {
      if (_isCancelled) break;
      await action(item, index);
      index++;
    }
  }
  bool get isCancelled => _isCancelled;
}
