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
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Please enter your name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: NetworkImage(
                    //       "http://bit.ly/flutter_tiger",
                    //     ),
                    //     fit: BoxFit.contain),
                    color: Colors.amber,
                    // gradient: LinearGradient(
                    //     colors: [Colors.amber, Colors.yellow])
                  ),
                  height: 150.0,
                  width: 150.0,
                ),
              )
            ],
          ),
        ));
  }
}
