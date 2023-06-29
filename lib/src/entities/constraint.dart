import 'expression.dart';
import 'keyword.dart';

/// Enumeration symbolizing an Sqlite constraint.
/// Instances: ASC, DESC, PRIMARY_KEY, NOT_NULL, UNIQUE.
///
/// Note: Use the getter `keyword` to retrieve the string representing
/// the Sqlite constraint.
enum Constraint implements Keyword {
  asc('ASC'),
  desc('DESC'),
  primaryKey('PRIMARY KEY'),
  notNull('NOT NULL'),
  unique('UNIQUE');

  const Constraint(this.keyword);

  /// The Sqlite keyword associated with the instance.
  @override
  final String keyword;

  /// Returns `True` if the constraint is `Constraint.PRIMARY_KEY`.
  bool get isPrimary => (this == primaryKey);

  /// Returns `True` if the constraint is `Constraint.UNIQUE`.
  bool get isUnique => (this == unique);

  /// Return `True` if the constraint is `Constraint.NOT_NULL`.
  bool get isNotNull => (this == notNull);
}

/// Represents a table wide Sqlite Check constraint that is enforced during
/// an INSERT or and UPDATE.
class CheckConstraint {
  /// Has to be a valid Sqlite expression involving only the columns of the
  /// table in context.
  final Expr expr;

  const CheckConstraint(this.expr);
}
