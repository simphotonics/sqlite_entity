import 'constraint.dart';
import 'replicator.dart';
import 'sqlite_type.dart';

/// Class used to define Sqlite columns and the corresponding data model fields.
class Column<T extends SqliteType> implements Replicator {
  /// Generic constructor, only the following type arguments are supported:
  /// * [Integer], [Boolean], [Text], and [Real].
  const Column({
    this.constraints = const <Constraint>{},
    this.defaultValue,
    this.name = '',
    this.doc = '',
  });

  /// Empty set or instances of [Constraint].
  final Set<Constraint> constraints;

  /// Default value specified when defining the Sqlite column.
  final T defaultValue;

  /// Optional [name]. Has to be a valid Dart identifier.
  final String name;

  /// Optional [doc]. Dart documentation.
  final String doc;

  /// Returns a formatted Dart documentation [String].
  /// Never returns [null].
  ///
  /// If [doc] does not start with comment markers these will be added.
  String get formattedDoc {
    final _doc = doc.trim();
    if (_doc.startsWith('//')) return _doc;
    if (_doc.isNotEmpty) {
      return '/// $_doc';
    } else {
      return '';
    }
  }

  /// Returns the type argument of `T extends SqliteType`.
  /// * Valid type args are: `int`, `String`, `bool`, `double`.
  Type get typeArgument {
    switch (T) {
      case Integer:
        return Integer.typeArg;
        break;
      case Text:
        return Text.typeArg;
        break;
      case Real:
        return Real.typeArg;
        break;
      case Boolean:
        return Boolean.typeArg;
      default:
        return Null;
    }
  }

  /// Returns the type argument of `this`.
  Type get type => T;

  /// Returns a `String` mapping [T] to an Sqlite compatible type.
  String get mappedType {
    return SqliteType.mappedType<T>();
  }

  /// Returns `true` if the `Set` [constraints] contains
  /// `Constraint.PRIMARY_KEY`.
  bool get isPrimary {
    return constraints.contains(Constraint.PRIMARY_KEY);
  }

  /// Returns true if the set [constraints] contains:
  /// `Constraint.UNIQUE`.
  bool get isUnique {
    return constraints.contains(Constraint.UNIQUE);
  }

  /// Returns a new instance of `Column`, the (non-null)
  /// parameters overriding old field values.
  Column<T> overrideWith({
    Set<Constraint> constraints,
    T defaultValue,
    String name,
    String doc,
  }) {
    return Column<T>(
      constraints: constraints ?? this.constraints,
      defaultValue: defaultValue ?? this.defaultValue,
      name: name ?? this.name,
      doc: doc ?? this.doc,
    );
  }

  /// Returns the class declaration used by the getter [sourceCode].
  String get classDeclaration => 'Column<$T>(';

  /// Returns a `String` containing source code
  /// representing `this`.
  @override
  String get sourceCode {
    final b = StringBuffer();
    b.writeln(classDeclaration);
    b.write(fields);
    b.write(')');
    return b.toString();
  }

  /// Returns a `String` containing a source source
  /// representation of the field intializers of `this`.
  String get fields {
    final b = StringBuffer();
    if (constraints.isNotEmpty) {
      b.writeln('  constraints: { ');
      for (var constraint in constraints) {
        b.writeln('    Constraint.${constraint.stringValue},');
      }
      b.writeln('  },');
    }
    if (defaultValue != null) {
      b.writeln('  defaultValue: $defaultValue,');
    }
    if (name.isNotEmpty) {
      b.writeln('  name: \'$name\',');
    }
    return b.toString();
  }

  /// Returns the `String` used in source-code
  /// writers emitting an Sqlite column:
  /// column-name + column-data-type + column-constraints.
  @override
  String toString() =>
      name +
      mappedType +
      constraints.fold<String>(
          '', (prev, current) => prev + current.stringValue + ' ');
}
