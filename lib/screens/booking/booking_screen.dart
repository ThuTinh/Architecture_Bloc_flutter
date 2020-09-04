import 'package:demo_bloc/widgets/button_widget.dart';
import 'package:demo_bloc/screens/booking/widgets/dropdown_select_hotel_widget.dart';
import 'package:demo_bloc/screens/booking/widgets/select_pepole_widget.dart';
import 'package:demo_bloc/screens/booking/widgets/select_time_widget.dart';
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
  static doSomething() {
    print('i ne: kaka');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorGray,
      body: Center(
        child: Card(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Wrap(
              children: [
                SizedBox(
                  height: 20,
                  width: 10,
                ),
                DropdownHotelWiget(),
                SelectimeWiget(),
                SelectPepoleWiget(),
                CustomRedButton(
                  title: "Search",
                  callback: doSomething,
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                ),
              ],
            )),
      ),
    );
  }
}
