// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constraint.dart';

// **************************************************************************
// ValueGenerator
// **************************************************************************

/// Extension on `Constraint` providing value-getters.
extension ConstraintValue on Constraint {
  /// Returns the String identifier of an instance of `Constraint`.
  String get stringValue => const <Constraint, String>{
        Constraint.PRIMARY_KEY: 'PRIMARY_KEY',
        Constraint.ASC: 'ASC',
        Constraint.DESC: 'DESC',
        Constraint.AUTOINCREMENT: 'AUTOINCREMENT',
        Constraint.NOT_NULL: 'NOT_NULL',
        Constraint.UNIQUE: 'UNIQUE',
      }[this]!;
}
