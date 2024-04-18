import 'package:flutter/material.dart';

import '../../routing.dart';
import '../widgets/todo_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TodoListWidget(),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routing.router.push("/add");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
