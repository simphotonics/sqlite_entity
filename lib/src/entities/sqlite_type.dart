import 'keyword.dart';

/// [GenericEnum] symbolizing valid Sqlite types.
enum SqliteType implements Keyword {
  integer('INTEGER', int),
  integerBool('INTEGER', bool),
  real('REAL', double),
  text('TEXT', String);

  const SqliteType(this.keyword, this.type);

  @override
  final String keyword;

  /// Dart type associated with the Sqlite type.
  final Type type;
}
