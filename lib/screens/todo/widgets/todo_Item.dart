import 'package:demo_bloc/models/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatefulWidget {
  final Todo todo;
  ToDoItem({Key key, @required this.todo});
  @override
  State<StatefulWidget> createState() {
    return _ToDoItem(todo: todo);
  }
}

class _ToDoItem extends State<ToDoItem> {
  Todo todo;
  _ToDoItem({Key key, @required this.todo});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      borderOnForeground: true,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(todo.title),
            ),
          ),
          Container(
            child: Switch(
              value: todo.completed,
              onChanged: (value) {
                Todo tempTodo = todo;
                tempTodo.completed = !todo.completed;
                setState(() {
                  todo = tempTodo;
                });
              },
              activeColor: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
