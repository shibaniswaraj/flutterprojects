import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'bottom_button.dart';

class screen1 extends StatelessWidget {
  screen1(
      {required this.bmi, required this.result, required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xFF11061B),
        ),
        scaffoldBackgroundColor: Color(0xFF11061B),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'BMI Calculator',
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment
                    .centerLeft, //if you want your first line to start from center/left/right
                child: Text(
                  'Your Result',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: kwhenactivated,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0), //to make edges of rectangle round
                  ),
                ),
                margin: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Text(
                        result,
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        bmi,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 70.0,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child:
                              Text('Normal BMI range:', style: klabelTextStyle),
                        ),
                        Center(
                          child: Text(
                            '18.5-25 kg/m2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          interpretation,
                          textAlign: TextAlign
                              .center, //if you want your second line to start from center/left/right
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Bottombutton(
                  title: 'RE-CALCULATE YOUR BMI',
                  onPress: () {
                    Navigator.pop(context);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
