import 'package:flutter/material.dart';

class TodoListHeader extends StatelessWidget {
  const TodoListHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'My Task',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
