import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectimeWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectimeWiget();
  }
}

class _SelectimeWiget extends State<SelectimeWiget> {
  DateTime _fromDate = DateTime.now();
// DateFormat.yMMMd().format(_fromDate);
  Future<void> _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _showDatePicker,
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("1/1/2020 - 2/2/2020"),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                )
              ],
            )));
  }
}
