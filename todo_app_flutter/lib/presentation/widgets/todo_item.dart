import 'package:flutter/material.dart';

import '../../domain/models/todo.dart';
import '../../routing.dart';

class TodoItem extends StatelessWidget {
  TodoItem({super.key, required this.item});

  Todo item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Card.filled(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          // hoverDuration: Duration(microseconds: 100),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    item.description,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            // Future.delayed(Duration(milliseconds: 300), () {
              Routing.router.push("/edit", extra: item.id);
            // });
          },
        ),
      ),
    );
  }
}
