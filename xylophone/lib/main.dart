import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  void play(int n) async {
    final AudioPlayer player = AudioPlayer();

    await player.setSource(AssetSource('assets_note$n.wav'));
    await player.resume();
  }

  Expanded buildk({required Color color, required int num}) {
    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: () {
            play(num);
          },
          child: Text(
            '$num',
            style: TextStyle(
              fontSize: 30.0,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildk(color: Colors.red, num: 1),
              buildk(color: Colors.orange, num: 2),
              buildk(color: Colors.yellow, num: 3),
              buildk(color: Colors.lightGreen, num: 4),
              buildk(color: Colors.green, num: 5),
              buildk(color: Colors.blue, num: 6),
              buildk(color: Colors.purple, num: 7),
            ],
          ),
        ),
      ),
    );
  }
}
