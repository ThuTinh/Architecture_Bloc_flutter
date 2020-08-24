import 'package:demo_bloc/models/todo.dart';
abstract class TodoRepository{
  Future<List<Todo>> getListTodoOfUser(int userId);
}