abstract class Dao<T> {
  Future<int> insert(T item);
  Future<List<T>> readAll();
  Future<int> update(T item);
  Future<int> delete(int id);
}
