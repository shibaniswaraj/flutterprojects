import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class CardContent extends StatelessWidget {
  CardContent({required this.label, required this.type});
  final String label;
  final IconData type;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          type,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
