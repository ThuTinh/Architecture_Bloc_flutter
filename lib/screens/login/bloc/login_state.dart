part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFalirue extends LoginState {
  final String err;
  LoginFalirue({@required this.err});
  @override
  List<Object> get props => [err];
}
