import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.systemBlue,
        title: Text(
          'Ask Me Anything',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: magic(),
    ),
  ));
}

class magic extends StatefulWidget {
  const magic({Key? key}) : super(key: key);

  @override
  State<magic> createState() => _magicState();
}

class _magicState extends State<magic> {
  int r = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: TextButton(
          onPressed: () {
            setState(() {
              r = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset('images/ball$r.png'),
        ),
      ),
    );
  }
}
