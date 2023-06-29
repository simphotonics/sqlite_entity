import 'constraint.dart';
import 'expression.dart';
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
    this.defaultValue,
    this.checkConstraint = const Expr(),
  });

  /// Empty set or any of:
  ///
  /// [Constraint.notNull],
  ///
  /// [Constraint.primaryKey],
  ///
  /// [Constraint.unique].
  final Set<Constraint> constraints;

  /// Default value specified when defining the Sqlite column.
  final T? defaultValue;

  /// A column level check constraint. The expression must include only
  /// this column.
  final Expr checkConstraint;

  bool isPrimary() {
    return constraints.contains(Constraint.primaryKey);
  }

  bool isUnique() {
    return constraints.contains(Constraint.unique);
  }

  bool isNotNull() {
    return constraints.contains(Constraint.notNull);
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

enum ColumnType { virtual, stored }


class GeneratedColumn<T> extends Column<T> {
  /// Note: Generated columns may not specify a default value.
  GeneratedColumn({
    this.expr = const Expr(),
    this.columnType = ColumnType.virtual,
    super.constraints,
    super.checkConstraint,
  });

  final Expr expr;
  final ColumnType columnType;
}
