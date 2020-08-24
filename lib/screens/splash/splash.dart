import 'package:demo_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:demo_bloc/repositories/loginRepository/login_repository.dart';
import 'package:demo_bloc/screens/login/bloc/login_bloc.dart';
import 'package:demo_bloc/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.deepPurpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Test screen splash",
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            RaisedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
              },
              child: Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}
