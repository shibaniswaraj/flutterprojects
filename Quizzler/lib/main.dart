import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizzler());
}

Quizbrain quizbrain = Quizbrain();
int score = 0;

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({Key? key}) : super(key: key);

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> scorekeeper = [];
  void resetscore() {
    score = 0;
  }

  void checkAnswer(bool userpickedAns) {
    bool ca = quizbrain.getMeAnswer();
    setState(() {
      if (quizbrain.isFinished() == 1) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Finished!",
          desc: "You have reached the end,Score:$score",
          buttons: [
            DialogButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizbrain.reset();
        resetscore();
        scorekeeper = [];
      } else {
        if (userpickedAns == ca) {
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          score++;
        } else {
          scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizbrain.next();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizbrain.getMeQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
