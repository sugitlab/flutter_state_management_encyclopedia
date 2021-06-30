import 'package:flutter/material.dart';
import './task.dart';

class InheritedTask extends InheritedWidget {
  const InheritedTask({
    Key? key,
    this.tasks = const [],
    required Widget child,
    required this.add,
    required this.toggle,
  }) : super(key: key, child: child);

  final List<Task> tasks;
  final Function(String) add;
  final Function(String) toggle;

  @override
  bool updateShouldNotify(InheritedTask oldWidget) {
    if (tasks.length != oldWidget.tasks.length) {
      return true;
    }
    var results = oldWidget.tasks.map((old) =>
        old.done != tasks.firstWhere((task) => task.id == old.id).done);
    if (results.contains(false)) {
      return true;
    }
    return false;
  }

  static InheritedTask of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedTask>()!;
  }
}
