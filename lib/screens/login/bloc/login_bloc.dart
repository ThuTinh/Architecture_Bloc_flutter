import 'package:bloc/bloc.dart';
import 'package:demo_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:demo_bloc/models/modelApi/user_login.dart';
import 'package:demo_bloc/repositories/loginRepository/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({this.loginRepository, this.authenticationBloc})
      : super(LoginInitial());
  LoginState get initialState => LoginInitial();
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPress) {
      authenticationBloc.add(Login());
      yield LoginInitial();
      try {
        UserLogin userLogin =
            UserLogin(username: event.username, password: event.password);
        await loginRepository.login(userLogin);
        authenticationBloc.add(LoggedIn());
        yield LoginInitial();
      } catch (e) {
        yield LoginFalirue(err: "login fail");
      }
    }
  }
}
