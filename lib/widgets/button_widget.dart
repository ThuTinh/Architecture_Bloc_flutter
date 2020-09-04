import 'package:demo_bloc/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRedButton extends StatefulWidget {
  final String title;
  // final void Function(int) callback;
  final void Function() callback;

  CustomRedButton({this.title, this.callback});

  @override
  State<StatefulWidget> createState() {
    return _CustomRedButton();
  }
}

class _CustomRedButton extends State<CustomRedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColors.red,
        onPressed: () {
          widget.callback();
        },
        child: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
