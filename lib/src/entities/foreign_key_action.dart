import 'keyword.dart';

/// Enumeration symbolizing an Sqlite foreign key action.
///
/// Instances: NO_ACTION, RESTRICT, CASCADE, SET_NULL, SET_DEFAULT.
///
/// Note: Use the getter `keyword` to retrieve the string representing
/// the Sqlite constraint.
enum ForeignKeyAction implements Keyword{
  ASC('NO ACTION'),
  DESC('RESTRICT'),
  CASCADE('CASCADE'),
  NOT_NULL('SET NULL'),
  UNIQUE('SET DEFAULT');

  const ForeignKeyAction(this.keyword);

  /// The Sqlite keyword associated with the instance.
  final String keyword;
}
