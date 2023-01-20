import 'column.dart';
import 'constraint.dart';
import 'model.dart';
import 'sqlite_type.dart';

/// Class representing a [Column] that is bound to the data-model [M].
class AnchoredColumn<M extends Model, T extends SqliteType> extends Column<T> {
  const AnchoredColumn({
    Set<Constraint> constraints = const <Constraint>{},
    required this.name,
    required T defaultValue,
    this.doc = '',
  }) : super(
          constraints: constraints,
          defaultValue: defaultValue,

        );

  /// Returns the type [M].
  Type get modelType => M;

  final String name;
  final String doc;

  /// Returns the class declaration used by the getter [sourceCode].
  String get classDeclaration => 'AnchoredColumn<${M.toString()}, $T>(';

  @override
  String toString() => 'To Do: Column $name source code: ';

  /// Returns a `String` containing a source code
  /// representation of an [AnchoredColumn] with
  /// fields copied from [column] and model type [modelType].
  static String sourceCodeFrom({
    required Column column,
    required String modelType,
  }) {
    final b = StringBuffer();
    // b.writeln('AnchoredColumn<$modelType, ${column.type}>(');
    // b.write(column.fields);
    b.write(')');
    return b.toString();
  }
}
