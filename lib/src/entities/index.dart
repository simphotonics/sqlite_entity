import 'column.dart';

/// Specifies an index.
class Index {
  /// List of indexed columns
  final List<Column> columns;

  final bool isUnique;

  /// To be used as a final variable within a [Table] class declaration.
  /// Usage:
  ///
  /// ```
  /// class _PlayerTable{
  ///   static const id = Column<int>(constraints: [
  ///     Constraint.PRIMARY_KEY,
  ///   ]);
  ///
  ///   static const pid1 = Column<int>();
  ///   static const pid2 = Column<int>();
  ///
  ///   final index = Index(indexedColumns[
  ///       pid1,
  ///       pid2,
  ///     ],
  ///     isUnique = true,
  ///   );
  ///
  /// }
  /// ```
  const Index({
    required this.columns,
    this.isUnique = false,
  });
}

/// Specifies an index. To be used within the declaration of a [Table] class.
class ExpressionIndex {
  /// List of column expressions. The columns should belong to the
  /// encompassing table.
  /// Example:
  /// ```
  /// ['min($pid1,$pid2)','max($pid1, $pid2)']
  ///
  /// ```
  final List<String> expressions;

  /// Set to true to declare a UNIQUE INDEX.
  final bool isUnique;

  /// To be used within a [Table] declaration.
  /// Usage:
  ///
  /// ```
  /// class _PlayerTable{
  ///   static const id = Column<int>(constraints: [
  ///     Constraint.PRIMARY_KEY,
  ///   ]);
  ///
  ///   static const pid1 = Column<int>();
  ///   static const pid2 = Column<int>();
  ///
  ///   final index = ExpressionIndex(expressions: [
  ///       'min($pid1,$pid2)',
  ///       'max($pid1, $pid2)'
  ///     ],
  ///     isUnique : true,
  ///   );
  ///
  /// }
  /// ```
  const ExpressionIndex({
    required this.expressions,
    this.isUnique = false,
  });
}
