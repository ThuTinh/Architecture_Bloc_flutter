import 'package:demo_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:demo_bloc/constants/colors.dart';
import 'package:demo_bloc/repositories/loginRepository/login_repository.dart';
import 'package:demo_bloc/repositories/loginRepository/login_repository_imp.dart';
import 'package:demo_bloc/repositories/todo_repository/todo_repository.dart';
import 'package:demo_bloc/repositories/todo_repository/todo_repository_imp.dart';
import 'package:demo_bloc/screens/login/login_page.dart';
import 'package:demo_bloc/screens/splash/splash.dart';
import 'package:demo_bloc/screens/todo/bloc/todo_bloc.dart';
import 'package:demo_bloc/screens/todo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  final LoginRepository loginRepository = LoginRepositoryImpl();
  final TodoRepository todoRepository = TodoRepositoryImp();

  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(loginRepository: loginRepository);
      },
    ),
    BlocProvider<TodoBloc>(
      create: (context) {
        return TodoBloc(todoRepository: todoRepository);
      },
    ),
  ], child: App(loginRepository: loginRepository)));
}

class App extends StatelessWidget {
  final LoginRepository loginRepository;

  App({Key key, @required this.loginRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(bluePrimary),
        ),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            // ignore: missing_return
            builder: (context, state) {
          if (state is AuthenticationIntialized) {
            return Splash();
          }
          if (state is AuthenticationAuthenticated) {
            return ToDo();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
              loginRepository: loginRepository,
            );
          }
          return Text("hihuhuhuhu");
        }));
  }
}
