import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerTest();
  }
}

class _ImagePickerTest extends State<ImagePickerTest> {
  File _image;
  Future getImage() async {
    var pick = ImagePicker();
    try {
      var image = await pick.getImage(source: ImageSource.camera);
      setState(() {
        _image = File(image.path);
      });

      print('image path ne: ${image.path}');
      Navigator.of(context).pop();
    } catch (e) {
      print('errroooooooooo ${e.toString()}');
    }

    // setState(() {
    //   _image = File(image.path);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo image picker"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: getImage),
      body: Container(
        alignment: Alignment.center,
        child: _image != null ? Image.file(_image) : Text("no image"),
      ),
    );
  }
}
