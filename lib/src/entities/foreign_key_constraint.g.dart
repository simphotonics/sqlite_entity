// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foreign_key_constraint.dart';

// **************************************************************************
// ValueGenerator
// **************************************************************************

/// Extension on `ForeignKeyConstraint` providing value-getters.
extension ForeignKeyConstraintValue on ForeignKeyConstraint {
  /// Returns the String identifier of an instance of `ForeignKeyConstraint`.
  String get stringValue => const <ForeignKeyConstraint, String>{
        ForeignKeyConstraint.NOT_DEFERRABLE: 'NOT_DEFERRABLE',
        ForeignKeyConstraint.DEFERRABLE: 'DEFERRABLE',
        ForeignKeyConstraint.INITIALLY_DEFERRABLE: 'INITIALLY_DEFERRABLE',
        ForeignKeyConstraint.INITIALLY_DEFERRED: 'INITIALLY_DEFERRED',
        ForeignKeyConstraint.INITIALLY_IMMEDIATE: 'INITIALLY_IMMEDIATE',
      }[this]!;
}
