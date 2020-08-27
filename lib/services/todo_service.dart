import 'dart:convert';
import 'package:demo_bloc/constants/api.dart';
import 'package:demo_bloc/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<Todo>> getListTodoOfUser(int userId) async {
    try {
      var reponse = await http.get('$todoUrl?userId=$userId');
      if (reponse.statusCode == 200) {
        print(reponse.body);
        print(jsonDecode(reponse.body));
        return _convertJsonToListTodo(jsonDecode(reponse.body));
      } else {
        return null;
      }
    } catch (e) {
      throw ArgumentError("cant not get todo");
    }
  }

  List<Todo> _convertJsonToListTodo(List<dynamic> todos) {
    List<Todo> resutl = todos.map((json) => Todo.fromJson(json)).toList();
    return resutl;
  }
}
