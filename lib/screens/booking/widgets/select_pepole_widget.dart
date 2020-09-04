import 'package:demo_bloc/screens/booking/widgets/dropdown_select_number_pepole.dart';
import 'package:demo_bloc/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPepoleWiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectPepoleWiget();
  }
}

class _SelectPepoleWiget extends State<SelectPepoleWiget> {
  void applyInfoSelect() {
    print("applyInfoSelect");
    Navigator.of(context).pop();
  }

  showDialogChoosePepole() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                "Select rooms and guests",
                style: TextStyle(fontFamily: "Comfortaa"),
              ),
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rooms",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        DropdownSelectNumberWiget()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Adults"), DropdownSelectNumberWiget()],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Chidren",
                            style: TextStyle(
                              fontFamily: "Comfortaa",
                            )),
                        DropdownSelectNumberWiget()
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: CustomRedButton(
                        title: "Apply",
                        callback: applyInfoSelect,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Clear",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ]);
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: showDialogChoosePepole,
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
                Text("1 Adult, 1 Chidlren"),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                )
              ],
            )));
  }
}
