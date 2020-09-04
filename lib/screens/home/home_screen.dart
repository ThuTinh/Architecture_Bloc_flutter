import 'package:demo_bloc/screens/booking/booking_screen.dart';
import 'package:demo_bloc/screens/help/help_screen.dart';
import 'package:demo_bloc/screens/my_booking/my_booking_screen.dart';
import 'package:demo_bloc/screens/settings/settings_screen.dart';
import 'package:demo_bloc/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    BookingScreen(),
    MyBookingScreen(),
    HelpScreen(),
    SettingsScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Image appLogo = new Image(
    //     image: new ExactAssetImage("images/logo/logo_omena.png"),
    //     height: 28.0,
    //     width: 20.0,
    //     alignment: FractionalOffset.center);
    return Scaffold(
        appBar: AppBar(
            // title: Image.asset("images/logo/logo_omena.png"),
            ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            selectedItemColor: AppColors.red,
            unselectedItemColor: AppColors.textGray,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text(
                    "Book a room",
                  )),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.mail),
                  title: new Text(
                    "My booking",
                  )),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.person), title: new Text("Helps")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.person), title: new Text("Settings")),
            ]),
        body: _children[_currentIndex]);
  }
}
