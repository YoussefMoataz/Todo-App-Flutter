import 'package:floor/floor.dart';

import '../../models/todo.dart';


@dao
abstract class TodoDao {
  @Query("SELECT * FROM todo")
  Future<List<Todo>> getAllTodos();

  @Query("SELECT * FROM todo where id = :id")
  Future<Todo?> getTodo(int id);

  @insert
  Future<void> insertTodo(Todo todo);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTodo(Todo todo);

  @delete
  Future<void> deleteTodo(Todo todo);
}
