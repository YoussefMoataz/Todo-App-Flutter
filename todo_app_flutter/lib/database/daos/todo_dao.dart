import 'package:floor/floor.dart';

import '../../domain/todo.dart';

@dao
abstract class TodoDao{

  @Query("SELECT * FROM todo")
  Future<List<Todo>> getAllTodos();

  @insert
  Future<void> insertTodo(Todo todo);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTodo(Todo todo);

  @delete
  Future<void> deleteTodo(Todo todo);

}