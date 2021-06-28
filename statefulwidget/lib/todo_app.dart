import 'package:flutter/material.dart';
import './components/todo_list.dart';
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
  final List<Task> tasks = [];

  void addNewTask(String title) {
    setState(() {
      tasks.add(Task(title, false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: TodoList(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => newTaskBottomSheetForm(context),
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

void newTaskBottomSheetForm(context) {
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
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const NewTaskForm(),
        ),
      );
    },
  );
}

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({Key? key}) : super(key: key);
  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  String inputField = '';
  void updateInput(String text) {
    setState(() {
      inputField = text;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: SaveInput(
            input: inputField,
          ),
        ),
      ],
    );
  }
}

class SaveInput extends StatelessWidget {
  const SaveInput({
    Key? key,
    required this.input,
  }) : super(key: key);
  final String input;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Save'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
