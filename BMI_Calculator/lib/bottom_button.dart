import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constant.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton({required this.title, required this.onPress});
  final String title;
  final VoidCallback
      onPress; //always use Voidcallback if you want to declare a function null

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: Colors.redAccent,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        height: kheight,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
