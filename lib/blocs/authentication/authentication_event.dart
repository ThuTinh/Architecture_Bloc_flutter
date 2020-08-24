part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStart extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  // final UserLogin userLogin;
  // LoggedIn({@required this.userLogin});
  // @override
  // List<Object> get props => [userLogin];
}

class Login extends AuthenticationEvent {}

class LogOut extends AuthenticationEvent {}
