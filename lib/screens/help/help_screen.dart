import 'package:demo_bloc/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HelpScreen();
  }
}

class _HelpScreen extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorGray,
      body: Container(
        decoration: BoxDecoration(),
        child: Text(" Helps"),
      ),
    );
  }
}
