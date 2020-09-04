import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownHotelWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropdownHotelWiget();
  }
}

class _DropdownHotelWiget extends State<DropdownHotelWiget> {
  List<Hotel> _hotels = Hotels.getHotels();
  List<DropdownMenuItem<Hotel>> _dropdownMenuItems;
  Hotel _hotelSelected;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdonwnMenuItems();
    initHotelSelect();
    super.initState();
  }

  initHotelSelect() {
    _hotelSelected = _hotels.isEmpty ? null : _hotels.elementAt(0);
  }

  buildDropdonwnMenuItems() {
    List<DropdownMenuItem<Hotel>> result = List();
    for (var hotel in _hotels) {
      result.add(DropdownMenuItem(
        child: Container(
          child: Text(
            hotel.name,
          ),
        ),
        value: hotel,
      ));
    }
    return result;
  }

  onChangeHotel(Hotel hotel) {
    setState(() {
      _hotelSelected = hotel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 20),
        // width: MediaQuery.of(context).size.width,
        child: DropdownButton(
          focusColor: Color(0xffC4C4C4),
          underline: Container(),
          iconSize: 20,
          icon: Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          items: _dropdownMenuItems,
          onChanged: onChangeHotel,
          value: _hotelSelected,
        ));
  }
}

class Hotel {
  final String name;
  Hotel(this.name);
}

class Hotels {
  static List<Hotel> getHotels() {
    return [
      Hotel("English3wwwwwwww"),
      Hotel("Filand"),
      Hotel("Estonia"),
      Hotel("English1"),
      Hotel("Filand1"),
      Hotel("Estonia2"),
      Hotel("English3"),
      Hotel("Filand7"),
      Hotel("Estonia4"),
    ];
  }
}
