class DataResponse<T> {
  final String? error;
  final T? data;

  bool get hasData => data != null;
  bool get hasError => error != null;

  DataResponse({
    this.error,
    this.data,
  });
}
