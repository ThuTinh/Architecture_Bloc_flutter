import 'package:demo_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Test screen splash",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
                },
                child: Text("Back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
