import 'column.dart';
import 'foreign_key_action.dart';
import 'foreign_key_constraint.dart';

/// Sqlite Foreign key concept.
class ForeignKey {
  const ForeignKey({
    required this.childKey,
    required this.parentKey,
    this.constraints = const {},
    this.onDelete = ForeignKeyAction.cascade,
    this.onUpdate = ForeignKeyAction.cascade,
  });

  /// Referenced child key.
  final Column childKey;

  /// Referenced parent key.
  final Column parentKey;

  /// Foreign key constraints.
  final Set<ForeignKeyConstraint> constraints;

  /// Foreign key action taken on updating
  /// the parent column(s).
  final ForeignKeyAction onUpdate;

  /// Foreign key action taken on deleting
  /// the parent column(s).
  final ForeignKeyAction onDelete;

  @override
  String toString() {
    return ''' ForeignKey: child: $childKey,
               parent: $parentKey,
               constraints: $constraints,
               onUpdate: $onUpdate,
               onDelete: $onDelete
    ''';
  }
}

/// Sqlite composite Foreign key concept.
class CompositeForeignKey {
  const CompositeForeignKey({
    required this.childKeys,
    required this.parentKeys,
    this.constraints = const {},
    this.onDelete = ForeignKeyAction.cascade,
    this.onUpdate = ForeignKeyAction.cascade,
  });

  /// Referenced child keys.
  final Set<Column> childKeys;

  /// Referenced parent keys.
  final Set<Column> parentKeys;

  /// Foreign key constraints.
  final Set<ForeignKeyConstraint> constraints;

  /// Foreign key action taken on updating
  /// the parent column(s).
  final ForeignKeyAction onUpdate;

  /// Foreign key action taken on deleting
  /// the parent column(s).
  final ForeignKeyAction onDelete;

  @override
  String toString() {
    return ''' ForeignKey: child: $childKeys,
               parent: $parentKeys,
               onUpdate: $onUpdate,
               onDelete: $onDelete
    ''';
  }
}
