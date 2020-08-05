import 'package:analyzer/dart/element/type.dart' show DartType;
import 'package:meta/meta.dart';

import 'revivable_anchored_column.dart';
import '../entities/expr_format.dart';
import '../entities/sqlite_type.dart';

/// Base class for composing expressions used in
/// Sqlite CHECK constraints.
abstract class RevivableSqliteExpr<T extends SqliteType> {
  const RevivableSqliteExpr(this.modelType);

  final DartType modelType;
}

/// Expression used to encapsulate a contant of type:
///
///  [Integer], [Boolean], [Text], or [Real]
///
/// as an [RevSqliteExpr].
class RevivableLiteral<T extends SqliteType> extends RevivableSqliteExpr<T> {
  const RevivableLiteral(this.value, DartType modelType) : super(modelType);

  /// The value of the literal.
  final T value;

  @override
  String toString() => value.toString();
}

/// Expression modelling a column literal.
class RevivableColumnLiteral<T extends SqliteType>
    extends RevivableSqliteExpr<T> {
  /// Creates a column literal.
  const RevivableColumnLiteral(
    this.column,
    DartType modelType,
  ) : super(modelType);

  final RevivableAnchoredColumn<T> column;

  @override
  String toString() {
    return column.name;
  }
}

class RevivableColumnExpr<T extends SqliteType> extends RevivableSqliteExpr<T> {
  const RevivableColumnExpr({
    @required this.left,
    @required this.right,
    @required this.operatorName,
    @required DartType modelType,
    this.exprFormat = ExprFormat.FUNCTION,
  }) : super(modelType);

  final RevivableAnchoredColumn<T> left;
  final RevivableAnchoredColumn<T> right;
  final String operatorName;
  final ExprFormat exprFormat;

  @override
  String toString() => (exprFormat == ExprFormat.FUNCTION)
      ? '$operatorName(${left.name}, ${right.name})'
      : '${left.name} $operatorName ${right.name}';
}

/// Binary expression modelling max(left, right).
class RevivableMax<T extends SqliteType> extends RevivableColumnExpr<T> {
  const RevivableMax(
    RevivableAnchoredColumn<T> left,
    RevivableAnchoredColumn<T> right,
    DartType modelType,
  ) : super(
          operatorName: 'max',
          left: left,
          right: right,
          modelType: modelType,
        );
}

// Binary expression modelling min(left, right).
class RevivableMin<T extends SqliteType> extends RevivableColumnExpr<T> {
  const RevivableMin(
    RevivableAnchoredColumn<T> left,
    RevivableAnchoredColumn<T> right,
    DartType modelType,
  ) : super(
          operatorName: 'min',
          left: left,
          right: right,
          modelType: modelType,
        );
}

// Binary expression modelling left != right.
class RevivableNotEqual<T extends SqliteType> extends RevivableColumnExpr<T> {
  const RevivableNotEqual(
    RevivableAnchoredColumn<T> left,
    RevivableAnchoredColumn<T> right,
    DartType modelType,
  ) : super(
          operatorName: '!=',
          left: left,
          right: right,
          exprFormat: ExprFormat.OPERATOR,
          modelType: modelType,
        );
}

/// Binary expression modelling:
/// left-expression <logical operator> right-expression
/// or <logical operator> (left-expression, right-expression).
///
/// Note: The left operant is of type [ColumnExpr].
/// The right operant is of type [RevSqliteExpr].
class RevivableExpr<T extends SqliteType> extends RevivableSqliteExpr<T> {
  const RevivableExpr({
    @required this.left,
    @required this.right,
    @required this.operatorName,
    this.exprFormat = ExprFormat.FUNCTION,
    @required DartType modelType,
  }): super(modelType);

  final RevivableSqliteExpr<T> left;
  final RevivableSqliteExpr<T> right;
  final String operatorName;
  final ExprFormat exprFormat;

  /// Returns the table name of this expression.
  ///
  /// Throws [GeneratorError] is the expressions refer to different tables.
  String get table => modelType.toString();

  @override
  String toString() => (exprFormat == ExprFormat.FUNCTION)
      ? '$operatorName($left, $right)'
      : '$left $operatorName $right';
}
