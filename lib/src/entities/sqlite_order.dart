import 'keyword.dart';

/// Enumeration symbolizing the Sqlite order specification ASC/DESC.
/// Instances: ASC, DESC.
///
/// Note: Use the getter `keyword` to retrieve the string representing
/// the Sqlite constraint.
enum SqliteOrder implements Keyword {
  ASC('ASC'),
  DESC('DESC');

  const SqliteOrder(this.keyword);

  /// The Sqlite keyword associated with the instance.
  final String keyword;
}
