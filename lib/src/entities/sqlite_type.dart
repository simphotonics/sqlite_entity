import 'package:meta/meta.dart';

import 'replicator.dart';

/// Wrapper class that wraps the types:
/// * `int`, `bool`, `double`, or `String`.
class SqliteType<T> implements Replicator {
  const SqliteType._(this.value); // : super._();

  /// Value of type:
  /// * `int`, `bool`, `double`, or `String`.
  final T value;

  @override
  String get sourceCode => '${runtimeType}($value)';

  /// Returns a `String` representation of the
  /// wrapped `value`.
  @override
  String toString() => value.toString();

  /// Converts the type argument `T`
  /// to a valid Sqlite compatible type that can be
  /// used in queries.
  static String mappedType<T extends SqliteType>() {
    if (T == Boolean) return 'INTEGER';
    return T.toString().toUpperCase();
  }
}

/// SqliteType that wraps an [int].
@sealed
class Integer extends SqliteType<int> {
  const Integer(int value) : super._(value);

  /// Returns the type argument of `Integer`.
  static Type get typeArg => int;
}

/// SqliteType that wraps a [bool].
@sealed
class Boolean extends SqliteType<bool> {
  const Boolean(bool value) : super._(value);

  /// Returns the type argument of `Boolean`.
  static Type get typeArg => bool;
}

/// SqliteType that wraps a [String].
@sealed
class Text extends SqliteType<String> {
  const Text(String value) : super._(value);
  @override
  String get sourceCode => '${runtimeType}(\'$value\')';

  /// Returns the type argument of `Text`.
  static Type get typeArg => String;
}

/// SqliteType that wraps a [double].
@sealed
class Real extends SqliteType<double> {
  const Real(double value) : super._(value);

  /// Returns the type argument of `Real`.
  static Type get typeArg => double;
}
