import 'package:analyzer/dart/element/type.dart' show DartType;
import 'package:sqlite_entity/src/entities/column.dart';
import 'package:sqlite_entity/src/entities/constraint.dart';
import 'package:sqlite_entity/src/entities/model.dart';
import 'package:sqlite_entity/src/entities/sqlite_type.dart';

/// Class representing a [Column] that is bound to the data-model [M].
class AnchoredColumn<M extends Model, T extends SqliteType> extends Column<T> {
  const AnchoredColumn({
    Set<Constraint> constraints = const <Constraint>{},
    required String name,
    required this.modelDartType,
    T? defaultValue,
    String doc = '',
  }) : super(
          constraints: constraints,
          defaultValue: defaultValue,
          name: name,
          doc: doc,
        );

  /// DartType representation of [M].
  final DartType modelDartType;

  /// Returns the type [M].
  Type get modelType => M;

  /// Returns the table name.
  String get table => modelDartType.toString();

  /// Returns the class declaration used by the getter [sourceCode].
  @override
  String get classDeclaration => 'AnchoredColumn<$table, $T>(';

  @override
  String toString() => sourceCode;

  /// Returns a `String` containing a source code
  /// representation of an [AnchoredColumn] with
  /// fields copied from [column] and model type [modelType].
  static String sourceCodeFrom({
    required Column column,
    required String modelType,
  }) {
    final b = StringBuffer();
    b.writeln('AnchoredColumn<$modelType, ${column.type}>(');
    b.write(column.fields);
    b.write(')');
    return b.toString();
  }
}
