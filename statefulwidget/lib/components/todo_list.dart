import 'package:flutter/material.dart';
import '../models/task.dart';
import '../task_details.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.tasks, required this.toggle})
      : super(key: key);
  final List<Task> tasks;
  final Function(String) toggle;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Row(
            children: [
              IconButton(
                icon: Icon(tasks.elementAt(index).done
                    ? Icons.check
                    : Icons.circle_outlined),
                onPressed: () => {toggle(tasks.elementAt(index).id)},
              ),
              Text(tasks.elementAt(index).title),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => TaskDetails(
                  task: tasks.elementAt(index),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
