import 'column.dart';

/// Base class for composing Sqlite expressions.
///
/// The empty expression can be used where an expression is optional.
class Expr {
  const Expr();
}

/// Binary SqliteExpression.
abstract class Compare<T> extends Expr {
  const Compare(this.left, this.right);

  /// Left operand.
  final Column<T> left;

  /// Right operand.
  final Column<T> right;
}

class Max<T> extends Compare {
  const Max(super.left, super.right);
}

class Min<T> extends Compare {
  const Min(super.left, super.right);
}

class NotEqual<T> extends Compare {
  const NotEqual(super.left, super.right);
}

class Binary extends Expr {
  const Binary(this.left, this.right);

  final Expr left;
  final Expr right;
}

class And extends Binary {
  const And(super.left, super.right);
}

class Or extends Binary {
  const Or(super.left, super.right);
}
