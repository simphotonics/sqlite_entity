import 'package:sqlite_entity/src/entities/model.dart';

/// Base of a class that contains the Sqlite column definitions
/// of model [M].
abstract class Table<M extends Model> {
  const Table();
}
