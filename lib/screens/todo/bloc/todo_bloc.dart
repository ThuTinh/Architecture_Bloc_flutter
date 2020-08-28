import 'package:bloc/bloc.dart';
import 'package:demo_bloc/models/todo.dart';
import 'package:demo_bloc/repositories/todo_repository/todo_repository.dart';
import 'package:demo_bloc/services/sevice_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoRepository todoRepository = serviceLocator<TodoRepository>();
  TodoBloc() : super(ReadyGetTodo());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is GetTodos) {
      List<Todo> todos = await todoRepository.getListTodoOfUser(event.userId);
      if (todos != null) {
        yield GetTodoSucess(todos: todos);
      } else {
        yield GetToDoFail(message: "cannot get to do");
      }
    }
  }
}
