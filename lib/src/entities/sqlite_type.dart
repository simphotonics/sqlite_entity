import 'package:meta/meta.dart';
import 'package:sqlite_entity/src/entities/replicator.dart';

// /// Base class of an Sqlite compatible type.
// abstract class SqliteType {
//   const SqliteType._();

//   /// Returns source code representing [this].
//   String get sourceCode;
// }

/// Wrapper class that wraps the Dart types:
/// [int], [bool], [double], and [String].
class SqliteType<T> implements Replicator {
  const SqliteType._(this.value); // : super._();

  /// Sqlite value of type [T].
  final T value;

  @override
  String get sourceCode => '${runtimeType}($value)';

  @override
  String toString() => value.toString();
}

/// SqliteType that wraps an [int].
@sealed
class Integer extends SqliteType<int> {
  const Integer(int value) : super._(value);

  /// Returns the type argument of [SqliteType].
  static Type get type => int;
}

/// SqliteType that wraps a [bool].
@sealed
class Boolean extends SqliteType<bool> {
  const Boolean(bool value) : super._(value);

  /// Returns the type argument of [SqliteType].
  static Type get type => bool;
}

/// SqliteType that wraps a [String].
@sealed
class Text extends SqliteType<String> {
  const Text(String value) : super._(value);
  @override
  String get sourceCode => '${runtimeType}(\'$value\')';

  /// Returns the type argument of [SqliteType].
  static Type get type => String;
}

/// SqliteType that wraps a [double].
@sealed
class Real extends SqliteType<double> {
  const Real(double value) : super._(value);

  /// Returns the type argument of [SqliteType].
  static Type get type => double;
}
