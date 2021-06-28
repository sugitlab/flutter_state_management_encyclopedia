import 'package:flutter/material.dart';
import '../models/task.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: Colors.cyan.withOpacity(0.1 * index),
          title: Center(
            child: Text('$index: ${tasks.elementAt(index).title}'),
          ),
        );
      },
    );
  }
}
