import 'package:flutter/material.dart';

class OurWidget extends StatelessWidget {
  OurWidget({required this.colour, this.containerchild});

  final Widget?
      containerchild; //to make this parameter not required we have to declare this parameter  null but we have to do so by using question mark since this widget type parameter cant hold a null value
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: containerchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius:
            BorderRadius.circular(10.0), //to make edges of rectangle round
      ),
    );
  }
}
