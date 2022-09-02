import 'package:flutter/material.dart';
import 'storyline.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Destini());
}

Storyline storyline = Storyline();

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Storypage(),
    );
  }
}

class Storypage extends StatefulWidget {
  const Storypage({Key? key}) : super(key: key);

  @override
  State<Storypage> createState() => _StorypageState();
}

class _StorypageState extends State<Storypage> {
  void checkNumber(int choicen) {
    setState(() {
      if (storyline.isEnd() == 1) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Finished!",
          desc: "You have reached the end",
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        storyline.reset();
      } else {
        storyline.next(choicen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/pic4.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Column(children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyline.getMeStorytext(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      fixedSize: Size(400.0, 50.0),
                    ),
                    onPressed: () {
                      checkNumber(1);
                    },
                    child: Text(storyline.getMeChoice1(),
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontFamily: 'HiMelody',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 5.0,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    15.0,
                    0.0,
                    15.0,
                    30.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, fixedSize: Size(400.0, 50.0)),
                    onPressed: () {
                      checkNumber(2);
                    },
                    child: Text(
                      storyline.getMeChoice2(),
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontFamily: 'HiMelody',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
