import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/core/input_fields/input_fields_cubit.dart';
import 'package:todo_app_flutter/core/todo_list/todo_list_cubit.dart';
import 'package:todo_app_flutter/routing.dart';

import '../../domain/Todo.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add page"),
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
          children: [
            BlocBuilder<InputFieldsCubit, InputFieldsState>(
              builder: (context, state) {
                return TextField(
                  controller: state.titleInputController,
                  onChanged: (value) =>
                      context
                          .read<InputFieldsCubit>()
                          .onTitleInputChanged(value),
                );
              },
            ),
            BlocBuilder<InputFieldsCubit, InputFieldsState>(
              builder: (context, state) {
                return TextField(
                    controller: state.descriptionInputController,
                    onChanged: (value) =>
                        context
                            .read<InputFieldsCubit>()
                            .onDescriptionInputChanged(value));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final title = context.read<InputFieldsCubit>().titleInputController.text;
          final description = context.read<InputFieldsCubit>().descriptionInputController.text;
          context.read<TodoListCubit>().insertTodo(title, description);
          Routing.router.pop();
        },
        child: Icon(Icons.check),
      ),);
  }
}