import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ourwidget.dart';
import 'card_content.dart';
import 'constant.dart';
import 'screen1.dart';
import 'bottom_button.dart';
import 'brain.dart';

enum Gen { male, female, nothing }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gen selectedgender = Gen.nothing;

  int heightt = 180;
  int weight = 75;
  int age = 29;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gen.male;
                      });
                    },
                    child: OurWidget(
                      containerchild: CardContent(
                        label: 'MALE',
                        type: FontAwesomeIcons.mars,
                      ),
                      colour: selectedgender == Gen.male
                          ? kwhenactivated
                          : kwhennotactivated,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gen.female;
                      });
                    },
                    child: OurWidget(
                        containerchild: CardContent(
                          label: 'FEMALE',
                          type: FontAwesomeIcons.venus,
                        ),
                        colour: selectedgender == Gen.female
                            ? kwhenactivated
                            : kwhennotactivated),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: OurWidget(
              colour: kwhenactivated,
              containerchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 1.0,
                    ),
                    child: Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        heightt.toString(),
                        style: knumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: heightt.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newvalue) {
                        setState(() {
                          heightt = newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: OurWidget(
                    colour: kwhenactivated,
                    containerchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: klabelTextStyle),
                        Text(
                          weight.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                size: 50.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: OurWidget(
                    colour: kwhenactivated,
                    containerchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: klabelTextStyle),
                        Text(
                          age.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                size: 50.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottombutton(
            title: 'CALCULATE YOUR BMI',
            onPress: () {
              Brain calc = Brain(height: heightt, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return screen1(
                      bmi: calc.calculation(),
                      result: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
