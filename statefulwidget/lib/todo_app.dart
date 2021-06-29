import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import './components/todo_list.dart';
import './components/todo_list_header.dart';
import './models/task.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp by StatefulWidget',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const TodoAppBody(),
    );
  }
}

class TodoAppBody extends StatefulWidget {
  const TodoAppBody({Key? key}) : super(key: key);
  @override
  _TodoAppBodyState createState() => _TodoAppBodyState();
}

class _TodoAppBodyState extends State<TodoAppBody> {
  List<Task> tasks = [];

  void addNewTask(String title) {
    const uuid = Uuid();
    setState(() {
      if (tasks.isNotEmpty) {
        tasks.add(Task(title, false, uuid.v4()));
      } else {
        tasks = [Task(title, false, uuid.v4())];
      }
    });
  }

  void toggleStatus(String id) {
    setState(() {
      tasks.firstWhere((task) => task.id == id).toggle();
    });
  }

  void newTaskBottomSheetForm(BuildContext context, Function(String) callback) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: _builder(context),
          ),
        );
      },
    );
  }

  Widget _builder(BuildContext context) {
    String inputField = '';
    void updateInput(String text) {
      setState(() {
        inputField = text;
      });
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (text) {
              updateInput(text);
            },
            autofocus: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'New Item',
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: const Text('Save'),
            onPressed: () {
              if (inputField.isEmpty) {
                return;
              }
              addNewTask(inputField);
              updateInput('');
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TodoListHeader(),
            Flexible(
              child: TodoList(tasks: tasks, toggle: toggleStatus),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => newTaskBottomSheetForm(context, addNewTask),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        notchMargin: 5,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
