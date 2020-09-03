import 'package:demo_bloc/screens/amazing_ui_mastercard/amazing_mastercard_page.dart';
import 'package:demo_bloc/screens/camera/camera_screen.dart';
import 'package:demo_bloc/screens/permistion/permistion_screen.dart';
import 'package:demo_bloc/screens/pick_image/index.dart';
import 'package:demo_bloc/screens/screenshot/screenshot.dart';
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
                child: Text("Back", style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
              ),
              // TextField(
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     labelText: "Name",
              //     hintText: "Please enter your name",
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5.0)),
              //   ),
              // ),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AmazingMastercard()));
                  },
                  child: Text(
                    "Show mastercard",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PermistionScreen()));
                  },
                  child: Text(
                    "Permistion screen",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TakePictureScreen()));
                  },
                  child: Text(
                    "Camera screen",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ScreenShotTest()));
                  },
                  child: Text(
                    "Screenshot screen",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ImagePickerTest()));
                  },
                  child: Text(
                    "pick image screen",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor)
            ],
          ),
        ));
  }
}
