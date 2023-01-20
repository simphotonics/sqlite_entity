import 'constraint.dart';
import 'replicator.dart';

/// Sqlite column info.
///
/// Annotation used to generate Dart source code.
class Column<T> implements Replicator {
  /// Generic constructor, only the following types are supported:
  ///
  /// [int], [bool], [String], and [double].
  ///
  /// These correspond to the Sqlite types:
  ///
  /// INTEGER, INTEGER, TEXT, and REAL.
  const Column({
    this.constraints = const {},
    required this.defaultValue,
  });

  /// Empty set or any of:
  ///
  /// [SqliteConstraint.NOT_NULL],
  ///
  /// [SqliteConstraint.PRIMARY_KEY],
  ///
  /// [SqliteConstraint.UNIQUE].
  final Set<Constraint> constraints;

  /// Default value specified when defining the Sqlite column.
  final T defaultValue;

  bool isPrimary() {
    return constraints.contains(Constraint.PRIMARY_KEY);
  }

  bool isUnique() {
    return constraints.contains(Constraint.UNIQUE);
  }

  bool isNotNull() {
    return constraints.contains(Constraint.NOT_NULL);
  }

  @override

  /// Source code replicating [this].
  String replicate() {
    var b = StringBuffer();
    b.writeln('Column<$T>(');
    b.writeln('  constraints: { ');
    for (var constraint in this.constraints) {
      b.writeln('    ${constraint.keyword},');
    }
    b.writeln('  },');
    b.writeln('  defaultValue: $defaultValue,');
    b.writeln(')');
    return b.toString();
  }
}
