import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/database/daos/todo_dao.dart';
import '../../domain/database/database.dart';
import '../../domain/models/todo.dart';


part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  late AppDatabase database;
  late TodoDao dao;

  late List<Todo> todos;

  TodoListCubit() : super(TodoListState(todos: [])) {
    init().then((_) {
      getList().then((_) {
        emit(TodoListState(todos: todos));
      });
    });
  }

  Future<void> init() async {
    database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    dao = database.todoDao;
  }

  Future<void> getList() async {
    todos = await dao.getAllTodos();
  }

  Future<Todo?> getTodo(int id) async {
    Todo? todo = await dao.getTodo(id);
    return todo;
  }

  Future<void> insertTodo(String title, String description) async {
    await dao.insertTodo(Todo(title: title, description: description));
    getList().then((value) {
      emit(TodoListState(todos: todos));
    });
  }

  Future<void> updateTodo(Todo todo) async {
    await dao.updateTodo(todo);
    getList().then((value) {
      emit(TodoListState(todos: todos));
    });
  }

  Future<void> deleteTodo(Todo todo) async {
    await dao.deleteTodo(todo);
    getList().then((value) {
      emit(TodoListState(todos: todos));
    });
  }
}
