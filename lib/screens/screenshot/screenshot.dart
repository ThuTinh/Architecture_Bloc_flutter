import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ScreenShotTest extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ScreenShot createState() => _ScreenShot();
}

class _ScreenShot extends State<ScreenShotTest> {
  int _counter = 0;
  File _imageFile;

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screeenshot"),
      ),
      body: Container(
        child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Screenshot(
                controller: screenshotController,
                child: Column(
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:' +
                          _counter.toString(),
                    ),
                    FlutterLogo(),
                  ],
                ),
              ),
              Text("Demo"),
              _imageFile != null
                  ? Image.file(_imageFile)
                  : Container(
                      child: Text("hihi"),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          _imageFile = null;
          screenshotController
              .capture(delay: Duration(milliseconds: 10))
              .then((File image) async {
            print("Capture Done");
            print(image);
            // setState(() {
            //   _imageFile = image;
            // });
            if (await Permission.storage.request().isGranted) {
              final result = await ImageGallerySaver.saveFile(image.toString());
              // var appDocDir = await getTemporaryDirectory();
              // print('path ne: $appDocDir');
              print('File Saved to Gallery ${image.toString()}');
            } else {
              print("permistion not grant");
            }
          }).catchError((onError) {
            print(onError);
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // _saved(File image) async {
  //   final result = await ImageGallerySaver.saveImage(image.readAsBytesSync());
  //   print("File Saved to Gallery");
  // }
}
