import 'package:flutter/material.dart';
import '../task_details.dart';
import '../models/inherited_task.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tasks = InheritedTask.of(context).tasks;
    final toggle = InheritedTask.of(context).toggle;
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
                onPressed: () => {
                  toggle(tasks.elementAt(index).id),
                },
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
