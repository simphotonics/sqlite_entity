import 'package:analyzer/dart/element/type.dart' show DartType;
import 'package:exception_templates/exception_templates.dart';
import 'package:sqlite_entity/src/entities/model.dart';
import 'package:sqlite_entity/src/entities/sqlite_expressions.dart';

/// Class modelling a table level Sqlite CHECK constraint.
/// Expressions will be joined together using `AND`.
/// Example: `CHECK(age > 16 AND max(id1, id2) < 100)`
class CheckConstraint<M extends Model> {
  /// Creates a table level CHECK constraint
  const CheckConstraint({
    required this.expressions,
    required this.modelType,
    this.name = '',
  });

  /// List of expressions related to a table level CHECK constraint.
  final List<SqliteExpr<M, dynamic>> expressions;

  /// Check constraint name. Must be a valid identifier
  /// (starts with a letter, is not empty, etc).
  ///
  /// Note: If [name] is not valid it will be omitted from
  /// the Sqlite statement initializing the check constraint.
  final String name;

  /// DartType representation of [M].
  final DartType modelType;

  /// Returns the table name. 
  String get table => modelType.toString();

  @override
  String toString() {
    final b = StringBuffer();
    if (isValidIdentifier(name)) {
      b.write('CONSTRAINT $name');
    }
    b.write('CHECK(');
    b.writeAll(expressions, ' AND ');
    b.write(')');
    return b.toString();
  }
}
