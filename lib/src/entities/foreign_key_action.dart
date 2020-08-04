import 'package:generic_enum/generic_enum.dart';

part 'foreign_key_action.g.dart';

/// Defines constants to be used as [ForeignKey] annotations.
@GenerateValueExtension()
enum ForeignKeyAction {
  NO_ACTION,
  RESTRICT,
  CASCADE,
  SET_NULL,
  SET_DEFAULT,
}
