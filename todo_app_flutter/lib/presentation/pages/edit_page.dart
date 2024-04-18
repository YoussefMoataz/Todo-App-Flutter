import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/core/input_fields/input_fields_cubit.dart';
import 'package:todo_app_flutter/core/todo_list/todo_list_cubit.dart';
import 'package:todo_app_flutter/routing.dart';

import '../../domain/todo.dart';

class EditPage extends StatelessWidget {
  int index;
  late Todo todo;

  EditPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    todo = context.read<TodoListCubit>().todos[index];
    context.read<InputFieldsCubit>().onTitleInputChanged(todo.title);
    context
        .read<InputFieldsCubit>()
        .onDescriptionInputChanged(todo.description);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit page"),
        leading: IconButton(
          onPressed: () {
            Routing.router.pop();
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<InputFieldsCubit, InputFieldsState>(
                builder: (context, state) {
                  return TextField(
                    controller: state.titleInputController,
                    onChanged: (value) => context
                        .read<InputFieldsCubit>()
                        .onTitleInputChanged(value),
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<InputFieldsCubit, InputFieldsState>(
                builder: (context, state) {
                  return TextField(
                    controller: state.descriptionInputController,
                    onChanged: (value) => context
                        .read<InputFieldsCubit>()
                        .onDescriptionInputChanged(value),
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final title =
              context.read<InputFieldsCubit>().titleInputController.text;
          final description =
              context.read<InputFieldsCubit>().descriptionInputController.text;
          todo.title = title;
          todo.description = description;
          context.read<TodoListCubit>().updateTodo(index, todo);
          Routing.router.pop();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
