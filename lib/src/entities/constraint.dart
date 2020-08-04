import 'package:generic_enum/generic_enum.dart';

part 'constraint.g.dart';

/// Enumeration used to specify Sqlite constraints.
/// when creating instances of [Column].
@GenerateValueExtension()
enum Constraint {
  PRIMARY_KEY,
  ASC,
  DESC,
  AUTOINCREMENT,
  NOT_NULL,
  UNIQUE,
}

extension ConstraintMethods on Constraint {
  /// Returns true if [this] == PRIMARY_KEY.
  bool get isPrimary => (this == Constraint.PRIMARY_KEY);

  /// Returns true if [this] == UNIQUE.
  bool get isUnique => (this == Constraint.UNIQUE);

  /// Returns true if [this] == NOT_NULL.
  bool get isNotNull => (this == Constraint.NOT_NULL);
}
