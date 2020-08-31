import 'package:demo_bloc/screens/amazing_ui_mastercard/widgets/card_item.dart';
import 'package:demo_bloc/screens/amazing_ui_mastercard/widgets/pine_chart.dart';
import 'package:demo_bloc/widgets/custom_boxshadow.dart';
import 'package:flutter/material.dart';

class AmazingMastercard extends StatelessWidget {
  final List category = [
    {"name": "Shopping", "amount": 500},
    {"name": "Restaurent", "amount": 200},
    {"name": "Car", "amount": 50},
    {"name": "Future", "amount": 30},
    {"name": "Eating out", "amount": 50},
  ];
  final List<Color> colors = [
    Color(0xFF206a5d),
    Color(0xFFc93838),
    Color(0xFFf75f00),
    Color(0xFF512c62),
    Color(0xFF290001),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "master card",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: Colors.blue[900].withOpacity(0.2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Thu Tinh",
                    style: TextStyle(
                        fontFamily: 'LondrinaSolid',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          boxShadow: customBoxShadow,
                          shape: BoxShape.circle,
                          color: Colors.orange),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          boxShadow: customBoxShadow,
                          shape: BoxShape.circle,
                          color: Colors.white60),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Select card",
                style: TextStyle(
                    fontFamily: 'LondrinaSolid',
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => CardItem(),
                  scrollDirection: Axis.horizontal,
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.only(left: 20),
                    child: Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: ListView.builder(
                              itemCount: category.length,
                              itemBuilder: (_, index) => Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: colors[index]),
                                        ),
                                        Text(category[index]["name"])
                                      ],
                                    ),
                                  )),
                        )),
                  ),
                  Container(
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            boxShadow: customBoxShadow,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              CustomPaint(
                                child: Container(),
                                foregroundPainter: PineChart(
                                    catelogy: category, colors: colors),
                              ),
                              Center(
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    boxShadow: customBoxShadow,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
