

import 'bound_column.dart';

/// Base class for composing SqliteExpressions.
abstract class SqliteExpression {
  const SqliteExpression();
}

/// Binary SqliteExpression.
abstract class BinaryExpression<T> extends SqliteExpression {
  const BinaryExpression(this.left, this.right);

  /// Left operand.
  final BoundColumn<T> left;

  /// Right operand.
  final BoundColumn<T> right;

  String generate();
}

class Max<T> extends BinaryExpression {
  const Max(BoundColumn<T> left, BoundColumn<T> right) : super(left, right);

  String generate() => 'max(${left.name}, ${right.name})';
}

class Min<T> extends BinaryExpression {
  const Min(BoundColumn<T> left, BoundColumn<T> right) : super(left, right);

  String generate() => 'min(${left.name}, ${right.name})';
}

class NotEqual<T> extends BinaryExpression {
  const NotEqual(BoundColumn<T> left, BoundColumn<T> right)
      : super(left, right);

  String generate() => '${left.name} != ${right.name}';
}
