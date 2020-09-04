import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownSelectNumberWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropdownSelectNumberWiget();
  }
}

class _DropdownSelectNumberWiget extends State<DropdownSelectNumberWiget> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  List<DropdownMenuItem<int>> _dropdownMenuItems;
  int _selected;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdonwnMenuItems();
    initHotelSelect();
    super.initState();
  }

  initHotelSelect() {
    _selected = numbers[0];
  }

  buildDropdonwnMenuItems() {
    List<DropdownMenuItem<int>> result = List();
    for (var number in numbers) {
      result.add(DropdownMenuItem(
        child: Container(
          child: Text(
            number.toString(),
          ),
        ),
        value: number,
      ));
    }
    return result;
  }

  onChangeHotel(int number) {
    setState(() {
      _selected = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5),
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width * 0.5,
        child: DropdownButton(
          focusColor: Color(0xffC4C4C4),
          underline: Container(),
          iconSize: 20,
          icon: Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          items: _dropdownMenuItems,
          onChanged: onChangeHotel,
          value: _selected,
        ));
  }
}
