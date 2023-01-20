/// Enumeration used to specify Sqlite Foreign Key Constraints
/// when creating instances of [Column].

enum ForeignKeyConstraint {
  NOT_DEFERRABLE,
  DEFERRABLE,
  INITIALLY_DEFERRABLE,
  INITIALLY_DEFERRED,
  INITIALLY_IMMEDIATE,
}
 