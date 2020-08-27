import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String titie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "hello",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(titie ?? "hihi"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "say hi");
                },
                child: Text("Back"),
              )
            ],
          ),
        ));
  }
}
