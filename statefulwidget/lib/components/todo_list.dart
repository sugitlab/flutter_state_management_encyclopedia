import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: Colors.cyan.withOpacity(0.1 * index),
          title: Center(
            child: Text('$index'),
          ),
        );
      },
    );
  }
}
