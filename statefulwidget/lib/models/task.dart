class Task {
  Task(this.title, this.done, this.id);
  String id;
  String title;
  bool done;

  void toggle() {
    done = !done;
  }
}
