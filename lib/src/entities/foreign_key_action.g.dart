// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foreign_key_action.dart';

// **************************************************************************
// ValueGenerator
// **************************************************************************

/// Extension on `ForeignKeyAction` providing value-getters.
extension ForeignKeyActionValue on ForeignKeyAction {
  /// Returns the String identifier of an instance of `ForeignKeyAction`.
  String get stringValue => const <ForeignKeyAction, String>{
        ForeignKeyAction.NO_ACTION: 'NO_ACTION',
        ForeignKeyAction.RESTRICT: 'RESTRICT',
        ForeignKeyAction.CASCADE: 'CASCADE',
        ForeignKeyAction.SET_NULL: 'SET_NULL',
        ForeignKeyAction.SET_DEFAULT: 'SET_DEFAULT',
      }[this];
}
