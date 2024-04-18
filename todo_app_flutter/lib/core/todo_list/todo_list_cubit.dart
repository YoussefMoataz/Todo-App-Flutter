import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/todo.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  late List<Todo> todos;

  TodoListCubit() : super(TodoListState(todos: [])) {
    todos = List<Todo>.generate(
      5,
      (index) => Todo(
        title: "Todo $index",
        description: "Description for todo $index",
      ),
    );
    emit(TodoListState(todos: todos));
  }

  void increment(index){
    todos[index].id++;
    emit(TodoListState(todos: todos));
  }

  void insertTodo(String title, String description){
    todos.add(Todo(title: title, description: description));
    emit(TodoListState(todos: todos));
  }

}
