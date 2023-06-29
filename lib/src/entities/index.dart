import 'column.dart';
import 'expression.dart';

/// Specifies an index.
class Index {
  /// List of indexed columns
  final Set<Column> columns;

  /// Adds unique constraint.
  final bool isUnique;

  /// Replace existing index
  final bool createIfExists;

  /// Sqlite expressions involving only the columns of table in context.
  final Set<Expr> exprs;

  const Index({
    this.columns = const <Column>{},
    this.isUnique = false,
    this.createIfExists = false,
    this.exprs = const <Expr>{},
  });
}
