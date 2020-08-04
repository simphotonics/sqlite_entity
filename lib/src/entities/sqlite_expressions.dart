import 'package:sqlite_entity/src/entities/anchored_column.dart';
import 'package:sqlite_entity/src/entities/expr_format.dart';
import 'package:sqlite_entity/src/entities/model.dart';
import 'package:sqlite_entity/src/entities/sqlite_type.dart';

/// Base class for composing expressions used in
/// Sqlite CHECK constraints.
abstract class SqliteExpr<M extends Model, T extends SqliteType> {
  const SqliteExpr();
}

/// Expression used to encapsulate a contant of type:
///
///  [Integer], [Boolean], [Text], or [Real]
///
/// as an [SqliteExpr].
class Literal<M extends Model, T extends SqliteType> extends SqliteExpr<M, T> {
  const Literal(this.value);

  /// The value of the literal.
  final T value;

  @override
  String toString() => value.toString();
}

/// Expression modelling a column literal.
class ColumnLiteral<M extends Model, T extends SqliteType>
    extends SqliteExpr<M, T> {
  /// Creates a column literal.
  const ColumnLiteral(this.column);

  final AnchoredColumn<M, T> column;

  @override
  String toString() {
    return column.name;
  }
}

class ColumnExpr<M extends Model, T extends SqliteType>
    extends SqliteExpr<M, T> {
  const ColumnExpr({
    required this.left,
    required this.right,
    required this.operatorName,
    this.exprFormat = ExprFormat.FUNCTION,
  });

  final AnchoredColumn<M, T> left;
  final AnchoredColumn<M, T> right;
  final String operatorName;
  final ExprFormat exprFormat;

  @override
  String toString() => (exprFormat == ExprFormat.FUNCTION)
      ? '$operatorName(${left.name}, ${right.name})'
      : '${left.name} $operatorName ${right.name}';
}

/// Binary expression modelling max(left, right).
class Max<M extends Model, T extends SqliteType> extends ColumnExpr<M, T> {
  const Max(AnchoredColumn<M, T> left, AnchoredColumn<M, T> right)
      : super(operatorName: 'max', left: left, right: right);
}

// Binary expression modelling min(left, right).
class Min<M extends Model, T extends SqliteType> extends ColumnExpr<M, T> {
  const Min(AnchoredColumn<M, T> left, AnchoredColumn<M, T> right)
      : super(operatorName: 'min', left: left, right: right);
}

// Binary expression modelling left != right.
class NotEqual<M extends Model, T extends SqliteType> extends ColumnExpr<M, T> {
  const NotEqual(AnchoredColumn<M, T> left, AnchoredColumn<M, T> right)
      : super(
          operatorName: '!=',
          left: left,
          right: right,
          exprFormat: ExprFormat.OPERATOR,
        );
}

/// Binary expression modelling:
/// left-expression <logical operator> right-expression
/// or <logical operator> (left-expression, right-expression).
///
/// Note: The left operant is of type [ColumnExpr].
/// The right operant is of type [SqliteExpr].
class Expr<M extends Model, T extends SqliteType> extends SqliteExpr<M, T> {
  const Expr({
    required this.left,
    required this.right,
    required this.operatorName,
    this.exprFormat = ExprFormat.FUNCTION,
  });

  final SqliteExpr<M, T> left;
  final SqliteExpr<M, T> right;
  final String operatorName;
  final ExprFormat exprFormat;

  /// Returns the table name of this expression.
  ///
  /// Throws [GeneratorError] is the expressions refer to different tables.
  String get table => M.toString();

  @override
  String toString() => (exprFormat == ExprFormat.FUNCTION)
      ? '$operatorName($left, $right)'
      : '$left $operatorName $right';
}

/// Class representing an expression where the
/// operands and operator/function are of type [String].
class StringExpression {
  const StringExpression(
      {required this.left,
      required this.right,
      required this.operatorName,
      this.exprFormat = ExprFormat.FUNCTION});

  /// Left operand.
  final String left;

  /// Right operand.
  final String right;

  /// Operator/function operatorName.
  final String operatorName;

  /// Flag changing the form of the expression.
  final ExprFormat exprFormat;

  /// Returns the expression as [String].
  @override
  String toString() {
    // operatorName and right operand might be empty when
    // representing a [Literal] or a [ColumnLiteral].
    final leftSeparator = operatorName.isEmpty ? '' : ' ';
    final rightSeparator = right.isEmpty ? '' : ' ';
    switch (exprFormat) {
      case ExprFormat.FUNCTION:
        return '$operatorName($left, $right)';
        break;
      case ExprFormat.OPERATOR:
        return '$left$leftSeparator$operatorName$rightSeparator$right';
      default:
        return 'Unknown ExprFormat.';
    }
  }
}
