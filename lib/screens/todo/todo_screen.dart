import 'package:demo_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:demo_bloc/repositories/todo_repository/todo_repository.dart';
import 'package:demo_bloc/repositories/todo_repository/todo_repository_imp.dart';
import 'package:demo_bloc/screens/todo/bloc/todo_bloc.dart';
import 'package:demo_bloc/screens/todo/widgets/todo_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToDo();
  }
}

class _ToDo extends State<ToDo> {
  @override
  void initState() {
    BlocProvider.of<TodoBloc>(context).add(GetTodos(userId: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logoutPressButton() {
      BlocProvider.of<AuthenticationBloc>(context).add(LogOut());
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "To do",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          FlatButton(
              onPressed: _logoutPressButton,
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state is GetTodoSucess) {
          return ListView.builder(
            itemBuilder: (context, index) => ToDoItem(
              todo: state.todos[index],
            ),
            itemCount: state.todos.length,
          );
        } else {
          if (state is GetToDoFail)
            return Container(
              alignment: Alignment.center,
              color: Colors.deepPurple,
              child: Text(
                state.message,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
