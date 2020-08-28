import 'package:demo_bloc/models/todo.dart';
import 'package:demo_bloc/repositories/loginRepository/login_repository.dart';
import 'package:demo_bloc/repositories/loginRepository/login_repository_imp.dart';
import 'package:demo_bloc/repositories/todo_repository/todo_repository.dart';
import 'package:demo_bloc/repositories/todo_repository/todo_repository_imp.dart';
import 'package:demo_bloc/services/login_service.dart';
import 'package:demo_bloc/services/todo_service.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // service
  serviceLocator.registerLazySingleton<LoginService>(() => LoginService());
  serviceLocator.registerLazySingleton<TodoService>(() => TodoService());
  serviceLocator
      .registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  serviceLocator
      .registerLazySingleton<TodoRepository>(() => TodoRepositoryImp());
  serviceLocator.registerFactory<Todo>(() => Todo());
  // serviceLocator
  //     .registerFactory<FavouriteViewModel>(() => FavouriteViewModel());
}
