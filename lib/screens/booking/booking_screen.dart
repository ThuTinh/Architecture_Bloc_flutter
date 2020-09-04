import 'package:demo_bloc/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookingScreen();
  }
}

class _BookingScreen extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorGray,
      body: Container(
        decoration: BoxDecoration(),
        child: Text("  Booking"),
      ),
    );
  }
}
