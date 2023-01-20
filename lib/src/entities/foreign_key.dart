import 'bound_column.dart';
import 'foreign_key_action.dart';

/// Sqlite Foreign key concept  used in class [Table].
class ForeignKey {
  /// Column(s)
  final List<BoundColumn> childColumns;

  /// Referenced (or parent) column(s).
  final List<BoundColumn> parentColumns;

  /// Foreign key action taken on updating
  /// the parent column(s).
  final ForeignKeyAction onUpdate;

  /// Foreign key action taken on deleting
  /// the parent column(s).
  final ForeignKeyAction onDelete;

  const ForeignKey({
    required this.childColumns,
    required this.parentColumns,
    this.onDelete = ForeignKeyAction.CASCADE,
    this.onUpdate = ForeignKeyAction.CASCADE,
  });

  @override
  String toString() {
    return ''' ForeignKey: childColumns: $childColumns,
               parentColumns: $parentColumns,
               onUpdate: $onUpdate,
               onDelete: $onDelete
    ''';
  }
}
