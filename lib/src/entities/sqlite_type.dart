import 'keyword.dart';

/// [GenericEnum] symbolizing valid Sqlite types.
enum SqliteType implements Keyword {
  INTEGER('INTEGER', int),
  BOOL('INTEGER', bool),
  REAL('REAL', double),
  TEXT('TEXT', String);

  const SqliteType(this.keyword, this.type);

  final String keyword;

  /// Dart type associated with the Sqlite type. 
  final Type type;
}
