import 'keyword.dart';

/// Enumeration symbolizing an Sqlite foreign key action.
///
/// Note: Use the getter `keyword` to retrieve the string representing
/// the Sqlite constraint.
enum ForeignKeyAction implements Keyword{
  noAction('NO ACTION'),
  restrict('RESTRICT'),
  cascade('CASCADE'),
  setNull('SET NULL'),
  setDefault('SET DEFAULT');

  const ForeignKeyAction(this.keyword);

  /// The Sqlite keyword associated with the instance.
  @override
  final String keyword;
}
