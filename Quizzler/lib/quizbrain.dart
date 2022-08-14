import 'package:quizzler/main.dart';

import 'question.dart';

class Quizbrain {
  int _qn = 0;

  List<Question> _questionbank = [
    Question('A cockroach can survive two weeks without oxygen', true),
    Question(
        'Seagulls mate for life and often return to the same place for mating',
        true),
    Question('AIDS finally have a cure', false),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void next() {
    if (_qn < _questionbank.length - 1) {
      _qn++;
    }
  }

  String getMeQuestion() {
    return _questionbank[_qn].q;
  }

  bool getMeAnswer() {
    return _questionbank[_qn].a;
  }

  int isFinished() {
    if (_qn == _questionbank.length - 1) {
      return 1;
    } else {
      return 0;
    }
  }

  void reset() {
    _qn = 0;
  }
}
