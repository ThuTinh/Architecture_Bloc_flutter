class Todo {
  String title;
  bool completed;
  Todo({this.title, this.completed});
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(title: json["title"], completed: json['completed']);
  }

  Map<String, dynamic> toJsonFromTodo() {
    return {"title": this.title, "completed": this.completed};
  }
}
