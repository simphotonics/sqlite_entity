import 'keyword.dart';

/// Enumeration used to specify Sqlite Foreign Key Constraints
/// when creating instances of [Column].

enum ForeignKeyConstraint implements Keyword {
  notDeferrable('NOT_DEFERRABLE'),
  deferrable('DEFERRABLE'),
  initiallyDeferrable('INITIALLY_DEFERRABLE'),
  initallyDeferred('INITIALLY_DEFERRED'),
  initiallyImmediate('INITIALLY_IMMEDIATE');

  const ForeignKeyConstraint(this.keyword);

  /// The Sqlite keyword associated with the foreign key constraint.
  @override
  final String keyword;
}
