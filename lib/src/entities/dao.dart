import 'model.dart';

/// Generic data access object.
abstract class Dao<T extends Model> {
  Future<int> insert(Map<String, dynamic> map);
  Future<int> delete(T obj);
  Future<List<T>> get all;
  Future<T> byId(int id);
  Future<int> update({int id, T obj});
}
