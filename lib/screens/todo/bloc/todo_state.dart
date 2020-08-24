part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTodoSucess extends TodoState {
  final List<Todo> todos;
  GetTodoSucess({ @required this.todos});
}

class GetToDoFail extends TodoState {
  final String message;
  GetToDoFail({@required this.message});
}

class ReadyGetTodo extends TodoState {}
