import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/todo_list/todo_list_cubit.dart';
import 'todo_item.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: TodoItem(
                    item: state.todos[index],
                  ),
                  onTap: () {
                    context.read<TodoListCubit>().increment(index);
                  },
                );
              }),
        );
      },
    );
  }
}
