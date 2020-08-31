import 'package:demo_bloc/widgets/custom_boxshadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue[900].withOpacity(0.1),
        boxShadow: customBoxShadow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
              top: 80,
              left: 10,
              right: 20,
              bottom: -300,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white38,
                    boxShadow: customBoxShadow),
              )),
          Positioned.fill(
              top: -20,
              left: -300,
              bottom: -20,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white38,
                    boxShadow: customBoxShadow),
              )),
          Align(
            alignment: Alignment.topLeft,

            // child: Image.asset("res/images/logo_mastercard.png"),
            child: Padding(
              padding: EdgeInsets.all(10),
              child:
                  Text("Logo", style: TextStyle(fontWeight: FontWeight.w400)),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(20),
              width: 60,
              height: 40,
              // child: Text("hihi"),
              decoration: BoxDecoration(
                  boxShadow: customBoxShadow,
                  color: Colors.white30,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "*** *** *** ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text("024",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'LondrinaSolid',
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("PALANEUM CARD",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'LondrinaSolid',
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
