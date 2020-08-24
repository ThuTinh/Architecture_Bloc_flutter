part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTodos extends TodoEvent {
  final int userId;
  GetTodos({this.userId});
}
