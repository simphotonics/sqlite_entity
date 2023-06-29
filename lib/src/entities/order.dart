import 'keyword.dart';

/// Enumeration symbolizing the Sqlite order specification ASC/DESC.
///
/// Note: Use the getter `keyword` to retrieve the string representing
/// the Sqlite constraint.
enum Order implements Keyword {
  asc('ASC'),
  desc('DESC');

  const Order(this.keyword);

  /// The Sqlite keyword associated with the instance.
  @override
  final String keyword;
}
