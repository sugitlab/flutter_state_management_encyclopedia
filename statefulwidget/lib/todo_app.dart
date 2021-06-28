import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp by StatefulWidget',
      theme: ThemeData.light(),
      home: Scaffold(
        body: const Center(
          child: Text('todo items'),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => {},
        ),
      ),
    );
  }
}
