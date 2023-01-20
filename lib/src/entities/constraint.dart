import 'keyword.dart';

/// Enumeration symbolizing an Sqlite constraint.
/// Instances: ASC, DESC, PRIMARY_KEY, NOT_NULL, UNIQUE.
///
/// Note: Use the getter `keyword` to retrieve the string representing
/// the Sqlite constraint.
enum Constraint implements Keyword {
  ASC('ASC'),
  DESC('DESC'),
  PRIMARY_KEY('PRIMARY KEY'),
  NOT_NULL('NOT NULL'),
  UNIQUE('UNIQUE');

  const Constraint(this.keyword);

  /// The Sqlite keyword associated with the instance.
  final String keyword;

  /// Returns `True` if the constraint is `Constraint.PRIMARY_KEY`.
  bool get isPrimary => (this == PRIMARY_KEY);

  /// Returns `True` if the constraint is `Constraint.UNIQUE`.
  bool get isUnique => (this == UNIQUE);

  /// Return `True` if the constraint is `Constraint.NOT_NULL`.
  bool get isNotNull => (this == NOT_NULL);
}

class CheckConstraint {
  /// Sqlite check constraint.
  ///
  /// Has to be a valid sqlite expression.
  /// Examples (age, id1, id2 are existing columns):
  /// ```
  /// 'age > 21'
  /// 'max(id1, id2) < 100'
  /// ```
  final String expression;

  const CheckConstraint(this.expression);
}
