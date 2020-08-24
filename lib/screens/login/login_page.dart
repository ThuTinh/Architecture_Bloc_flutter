import 'package:demo_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:demo_bloc/repositories/loginRepository/login_repository.dart';
import 'package:demo_bloc/screens/login/bloc/login_bloc.dart';
import 'package:demo_bloc/screens/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final LoginRepository loginRepository;

  LoginPage({Key key, @required this.loginRepository})
      : assert(loginRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) {
        return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            loginRepository: loginRepository);
      },
      child: LoginForm(),
    ));
  }
}
