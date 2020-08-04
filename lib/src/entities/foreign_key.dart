import 'anchored_column.dart';
import 'foreign_key_action.dart';
import 'foreign_key_constraint.dart';
import 'model.dart';
import 'sqlite_type.dart';

/// Sqlite Foreign key entity used in class [ModelDefinition].
///
/// Note: [C] must refer to the data model that is defined the
/// class extending [ModelDefinition].
class ForeignKey<C extends Model, P extends Model, T extends SqliteType> {
  /// Creates a new ForeignKey object.
  /// The lists [childColumns] and [parentColumns] should not be empty.
  const ForeignKey({
    required this.childColumn,
    required this.parentColumn,
    this.onDelete = ForeignKeyAction.CASCADE,
    this.onUpdate = ForeignKeyAction.CASCADE,
    this.constraints = const <ForeignKeyConstraint>{},
  });

  /// Child column(s)
  final AnchoredColumn<C, T> childColumn;

  /// Referenced (or parent) column(s).
  final AnchoredColumn<P, T> parentColumn;

  /// ForeignKeyAction taken on updating
  /// the parent column(s).
  final ForeignKeyAction onUpdate;

  /// ForeignKeyAction taken on deleting
  /// the parent column(s).
  final ForeignKeyAction onDelete;

  /// ForeignKey constraints.
  final Set<ForeignKeyConstraint> constraints;

  /// Returns the parent table.
  String get parentTable => parentColumn.modelDartType.toString();

  /// Returns the child table.
  String get childTable => childColumn.modelDartType.toString();

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
