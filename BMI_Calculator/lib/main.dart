import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Color(0xFF11061B),
        ),
        scaffoldBackgroundColor: Color(0xFF11061B),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}
