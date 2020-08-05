import 'package:analyzer/dart/element/type.dart';
import 'package:meta/meta.dart';

import '../entities/column.dart';
import '../entities/constraint.dart';
import '../entities/sqlite_type.dart';

/// Revivable equivalent of [AnchoredColumn].
/// * Stores the model type as a [DartType].
class RevivableAnchoredColumn<T extends SqliteType> extends Column<T> {
  const RevivableAnchoredColumn({
    Set<Constraint> constraints = const <Constraint>{},
    @required String name,
    @required this.modelType,
    T defaultValue,
    String doc = '',
  }) : super(
          constraints: constraints,
          defaultValue: defaultValue,
          name: name,
          doc: doc,
        );

  /// Returns the type [M].
  final DartType modelType;

  /// Returns the name of the table this column belongs to.
  /// * Note: The table name is derived from the model name.
  String get table => modelType.toString();
}
