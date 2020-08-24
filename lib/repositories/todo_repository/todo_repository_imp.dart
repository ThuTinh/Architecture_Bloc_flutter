import 'package:demo_bloc/models/todo.dart';
import 'package:demo_bloc/repositories/todo_repository/todo_repository.dart';
import 'package:demo_bloc/services/todo_service.dart';

class TodoRepositoryImp extends TodoRepository {
  TodoService todoService = TodoService();
  @override
  Future<List<Todo>> getListTodoOfUser(int userId) {
    return todoService.getListTodoOfUser(userId);
  }
}
