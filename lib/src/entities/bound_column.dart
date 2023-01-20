import 'column.dart';
import 'constraint.dart';

/// Column bound to a table with name [tableName].
/// The column [name] and [modelType] are required parameters.
class BoundColumn<T> extends Column<T> {
  const BoundColumn({
    //@required this.modelType,
    required this.name,
    Set<Constraint> constraints = const {},
    required T defaultValue,
  }) : super(
          constraints: constraints,
          defaultValue: defaultValue,
        );

  /// Column name.
  final String name;

  /// Type of the corresponding data model.
  /// Note: The model type is used to infer the
  ///       Sqlite table name.
  //final Type modelType;

  @override

  /// Source code representing [this].
  String replicate() {
    return source(
      name: this.name,
      type: T,
      constraints: this.constraints,
      defaultValue: this.defaultValue,
    );
  }

  /// Source code representing a bound column with input
  /// parameters: [name], [type], [modelType],
  ///             [constraints], [defaultValue].
  static String source({
    required String name,
    required Type type,
    //@required Type modelType,
    Set<Constraint> constraints = const {},
    dynamic defaultValue,
  }) {
    var b = StringBuffer();
    b.writeln('BoundColumn<$type>(');
    b.writeln('  name:\'$name\',');
    //b.writeln('  modelType: $modelType,');
    if (constraints.isNotEmpty) {
      b.writeln('  constraints: { ');
      for (var constraint in constraints) {
        b.writeln('    ${constraint.keyword},');
      }
      b.writeln('},');
    }
    if (defaultValue != null) {
      var encodedValue =
          (defaultValue is String) ? '\'$defaultValue\'' : '$defaultValue';
      b.writeln('  defaultValue: $encodedValue,');
    }
    b.writeln(')');
    return b.toString();
  }
}
