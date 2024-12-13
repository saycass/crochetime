sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success._;

  const factory Result.failure(Exception error) = Failure._;
}

final class Success<T> extends Result<T> {
  const Success._(this.value);

  final T value;

  @override
  String toString() => 'Result<$T>.success($value)';
}

final class Failure<T> extends Result<T> {
  const Failure._(this.error);

  final Exception error;

  @override
  String toString() => 'Result<$T>.failure($error)';
}
