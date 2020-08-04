import 'package:generic_enum/generic_enum.dart';

part 'foreign_key_constraint.g.dart';

/// Enumeration used to specify Sqlite Foreign Key Constraints
/// when creating instances of [Column].
@GenerateValueExtension()
enum ForeignKeyConstraint {
  NOT_DEFERRABLE,
  DEFERRABLE,
  INITIALLY_DEFERRABLE,
  INITIALLY_DEFERRED,
  INITIALLY_IMMEDIATE,
}
