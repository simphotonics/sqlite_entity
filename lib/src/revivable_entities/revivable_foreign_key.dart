import 'package:meta/meta.dart';

import '../entities/foreign_key_action.dart';
import '../entities/foreign_key_constraint.dart';
import '../entities/sqlite_type.dart';

import 'revivable_anchored_column.dart';

///
///
class RevivableForeignKey<T extends SqliteType> {
  /// Creates a new ForeignKey object.
  /// The lists [childColumns] and [parentColumns] should not be empty.
  const RevivableForeignKey({
    @required this.childColumn,
    @required this.parentColumn,
    this.onDelete = ForeignKeyAction.CASCADE,
    this.onUpdate = ForeignKeyAction.CASCADE,
    this.constraints = const <ForeignKeyConstraint>{},
  });

  /// Child column(s)
  final RevivableAnchoredColumn<T> childColumn;

  /// Referenced (or parent) column(s).
  final RevivableAnchoredColumn<T> parentColumn;

  /// ForeignKeyAction taken on updating
  /// the parent column(s).
  final ForeignKeyAction onUpdate;

  /// ForeignKeyAction taken on deleting
  /// the parent column(s).
  final ForeignKeyAction onDelete;

  /// ForeignKey constraints.
  final Set<ForeignKeyConstraint> constraints;

  /// Returns the parent table.
  String get parentTable => parentColumn.table;

  /// Returns the child table.
  String get childTable => childColumn.table;

  @override
  String toString() {
    final _constraints = constraints.fold<String>(
        '', (prev, current) => prev + current.stringValue + ' ');

    return 'FOREIGN KEY(${childColumn.name}) REFERENCES '
        '$parentTable(${parentColumn.name}) '
        '$_constraints '
        'ON UPDATE $onUpdate ON DELETE $onDelete';
  }
}
